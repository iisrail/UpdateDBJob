package com.verifone.ce.batch.jobs.activeterminal;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.verifone.ce.batch.jobs.BatchJobException;

public class RunSqlScriptTest {
	
	RunSqlScript sut;
	final static String dataSource = "jdbc:mysql://localhost:3306/mysql";
	final static String dbSchema = "cpp_11";
	final static String dbUser = "root";
	final static String dbPassowrd = "P@yware1";
	static String[] sqlConParams = { dataSource, dbUser, dbPassowrd };
	
	@Test
	public void updateDatabaseFromNoneFixedVersion() throws BatchJobException, SQLException, IOException{
		sut = new RunSqlScript();
		File f1 = new File("C:\\Users\\T_IgalI1\\AppData\\Local\\Temp\\haha\\data\\V2_1_0_21\\patch_V2_1_0_21.sql");
		File f2 = new File("C:\\Users\\T_IgalI1\\AppData\\Local\\Temp\\haha\\data\\V2_1_0_21\\patch_V2_1_0_21_DataSetup.sql");		
		List<File> scripts = new ArrayList<>();
		scripts.add(f1);
		scripts.add(f2);		
		sut.execute(scripts, sqlConParams, false, "cpp_11");
	}	
}
