package com.verifone.ce.batch.jobs.activeterminal;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;

import com.verifone.ce.batch.amazon.AmazonUtil;
import com.verifone.ce.batch.jobs.BatchJob;
import com.verifone.ce.batch.jobs.BatchJobException;

public class CreateUpdateDBJob implements BatchJob {

	private String environment;
	String dir;
	private RunSqlScript runSqlScript = new RunSqlScript();

	@Override
	public void execute(String[] args) throws BatchJobException {
		String dataSource = args[1];
		String dbSchema = args[2];
		String dbUser = args[3];
		String dbPassword = args[4];
		String accessKey = args[5];
		String secretKey = args[6];
		environment = args[7]; // dev
		String bucketName = args[8];
		boolean fromScratch = Boolean.parseBoolean(args[9]);
		String lastCreateVersion = args[10];
		String zipFile = args[11];
		//String lastUpdateVersion = args[12];

		AmazonUtil amazonUtil = new AmazonUtil(accessKey, secretKey);
		String[] sqlConParams = {dataSource, dbUser, dbPassword};
		List<File> sortedScripts;
		try {
			dir = extractPackage(amazonUtil, bucketName, zipFile);
			if (fromScratch) {
				sortedScripts = collectScriptsCreateDatabase(sqlConParams, lastCreateVersion);
			} else {
				sortedScripts = collectScriptsUpdateDatabase(sqlConParams, dbSchema, lastCreateVersion);
			}
			// print sortedScripts for debugging
			System.out.println("\nscripts after collectScripts function:");
			for (File script : sortedScripts) {
				System.out.println(script.getAbsolutePath());
			}
			
			System.out.println();
			 
			boolean status = runSqlScript.execute(sortedScripts, sqlConParams, fromScratch, dbSchema);
			if(!status){
				System.out.println("[CreateUpdateDBJob] Not all scripts succeeded");
				throw new BatchJobException("Not all scripts succeeded");
			}
			System.out.println("[CreateUpdateDBJob] All scripts succeeded");
		} catch (Exception se) {
			throw new BatchJobException(se.getMessage());
		}
	}

	/**
	 * 
	 * Extract a zip file to a temp directory
	 * 
	 * @param dataPackagePath
	 *            - path of ZIP file
	 * 
	 * @return root dir of extracted file and compress format
	 * 
	 * @throws IOException
	 * @throws Exception
	 * 
	 */
	private String extractPackage(AmazonUtil amazonUtil, String bucketName, String key) throws Exception {
		byte[] buffer = new byte[1024];
		int len;

		System.out.println("extractPackage start");

		// Create root temporary directory
		String root;
		try {
			root = Files.createTempDirectory(null).toString();
		} catch (IOException e) {
			throw new BatchJobException(e.getMessage());
		}

		// Create data directory
		new File(root + File.separator + "data").mkdirs();

		String temp = root + File.separator + "data";
		
		// Check format
		try(InputStream dataStream = amazonUtil.getS3ObjectContent(bucketName, key);
			ZipArchiveInputStream	zis = new ZipArchiveInputStream(dataStream);) {

			boolean empty = true;
			ArchiveEntry ze = zis.getNextEntry();

			while (ze != null) {

				String fileName = ze.getName();

				File newFile = new File(temp + File.separator + fileName);

				// create all non exists folders
				new File(newFile.getParent()).mkdirs();

				if (!ze.isDirectory()) {
					FileOutputStream fos = new FileOutputStream(newFile);
					while ((len = zis.read(buffer)) > 0) {
						fos.write(buffer, 0, len);
						empty = false;
					}
					fos.close();
				}
				ze = zis.getNextEntry();
			}

			if (empty) {
				throw new BatchJobException("Packge file is empty");
			}

		} 

		return temp;
	}

	List<File> collectScriptsCreateDatabase(String[] sqlConParams, final String untilVersion) throws BatchJobException, SQLException {
		if(untilVersion == null || !untilVersion.startsWith("V")){
			return iterateScripts(null);
		}
		else{
			FilenameFilter fileNameFilter = new FilenameFilter() {
	
				@Override
				public boolean accept(File dir, String name) {
					if (name.compareTo(untilVersion) > 0) {
						return false;
					}
					return true;
				}
			};
			return iterateScripts(fileNameFilter);
		}

	}

	List<File> collectScriptsUpdateDatabase(String[] sqlConParams, String dbSchema, String fromVersion) throws BatchJobException, SQLException {
		// query get last dbversion
		final String lastVersion;
		if(!fromVersion.equalsIgnoreCase("none")){
			lastVersion = fromVersion;
		}else{
			lastVersion = runSqlScript.getLastDBVersion(sqlConParams, dbSchema);
		}
		FilenameFilter fileNameFilter = new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				if (name.compareTo(lastVersion) > 0) {
					return true;
				}
				return false;
			}
		};
		return iterateScripts(fileNameFilter);

	}

	List<File> iterateScripts(FilenameFilter filter) throws BatchJobException {

		// returns pathnames for files and directory

		File[] files = new File(dir).listFiles(filter);
		// sort folders under base directory
		Arrays.sort(files, new Comparator<File>() {

			@Override
			public int compare(File o1, File o2) {
				String s1 = o1.getName();
				String s2 = o2.getName();
				return s1.compareTo(s2);
			}
		});
		List<File> sortedScripts = new LinkedList<File>();
		collectScripts(files, sortedScripts);// init sortedScripts
		
		return sortedScripts;

	}

	/**
	 * Recursive function that updates sortedScripts list
	 * 
	 * @param files
	 */
	void collectScripts(File[] files, List<File> sortedScripts) {

		for (File file : files) {
			String fileName = file.getName();

			if (file.isDirectory()) {

				System.out.println("Directory: " + fileName);
				if (!(fileName.startsWith("V") || fileName.equals(environment))) {
					System.out.println("skip Directory: " + fileName);
					continue;
				}
				// again the files should be sorted by name
				File[] innerFiles = file.listFiles();
				Arrays.sort(innerFiles, new Comparator<File>() {

					@Override
					public int compare(File o1, File o2) {
						String s1 = o1.getName();
						String s2 = o2.getName();
						return s1.compareTo(s2);
					}
				});				
				
				collectScripts(reorderFilesBeforeDirectories(innerFiles), sortedScripts); // Calls the same method again.
			} else {
				String parentName = file.getParentFile().getName();
				System.out.println("File: " + fileName + " File Parent: " + parentName);

				if (fileName.startsWith("patch_V") && !fileName.endsWith("TestData.sql")) {
					if (fileName.equals("patch_V1_1_0_3_PROD_DataSetup.sql")) {
						if (!environment.equals("prod")) {
							continue;
						}
					} else if (fileName.equals("patch_V1_1_0_3_NONPROD_DataSetup.sql")) {
						if (environment.equals("prod")) {
							continue;
						}
					}

					sortedScripts.add(file);
				}

			}
		}

	}
	
	File[] reorderFilesBeforeDirectories(File[] files) {
		int leftIndex = 0;  
		for(int i=0;i<files.length;i++){
			
			if(files[i].isFile()){
				File tFile = files[leftIndex];
				files[leftIndex] = files[i];
				files[i] = tFile;
				leftIndex++;
			}
		}
		return files;
	}

}
