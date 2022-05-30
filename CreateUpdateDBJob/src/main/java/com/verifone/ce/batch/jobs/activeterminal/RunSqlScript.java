package com.verifone.ce.batch.jobs.activeterminal;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.jdbc.ScriptRunner;

import com.verifone.ce.batch.jobs.BatchJobException;

public class RunSqlScript {
	
	public boolean execute(List<File> scripts, String[] strArr, boolean fromScratch, String dbSchema)
			throws BatchJobException, SQLException, IOException {
		// Create MySql Connection
		boolean status = true;
		try (Connection con = openConnection(strArr)) {
			setDatabase(con, fromScratch, dbSchema);

			// Initialise object for ScripRunner
			ScriptRunner sr = new ScriptRunner(con);
			sr.setStopOnError(true);
			sr.setAutoCommit(false);

			for (File script : scripts) {
				System.out.println("Run script file " + script.getName());
				try (Reader reader = new InputStreamReader(new FileInputStream(script), "UTF8")) {
					// Execute script
					if(script.getName().endsWith(".sp")){
						sr.setSendFullScript(true);
					}
					else{
						sr.setSendFullScript(false);
					}
					sr.runScript(reader);
				} catch (Exception e) {
					System.err.println("Failed to Execute" + script + " The error is " + e.getMessage());
					status = false;
					break;
				}
			}

		}
		System.out.println("[RunSqlScript] The status of running sql scripts is " + status);
		return status;
	}

	public String getLastDBVersion(String[] strArr, String dbSchema) throws SQLException, BatchJobException {
		String lastVersion;
		try (Connection con = openConnection(strArr)) {
			Statement stmt = con.createStatement();
			stmt.execute("use " + dbSchema);
			ResultSet rs = stmt.executeQuery("select max(version)  from dbversion_history");
			rs.next();
			lastVersion = rs.getString(1);
		}
		return lastVersion;
	}

	void setDatabase(Connection con, boolean fromScratch, String dbSchema) throws SQLException {
		Statement stmt = con.createStatement();
		if (fromScratch) {
			stmt.execute("drop database if exists " + dbSchema);
			stmt.execute("create database " + dbSchema + " CHARACTER SET latin1 COLLATE latin1_swedish_ci");
		}
		stmt.execute("use " + dbSchema);
	}

	Connection openConnection(String[] args) throws BatchJobException {
		String dataSource = args[0];
		String userName = args[1];
		String password = args[2];
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dataSource, userName, password);
		} catch (Exception e) {
			throw new BatchJobException(String.format("Cannot connect to database server: %s", e.toString()));
		}
	}

	

}
