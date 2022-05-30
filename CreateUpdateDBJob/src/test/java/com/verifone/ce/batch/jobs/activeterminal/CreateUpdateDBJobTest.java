package com.verifone.ce.batch.jobs.activeterminal;

import org.junit.Before;
import org.junit.Test;

import com.verifone.ce.batch.jobs.BatchJob;
import com.verifone.ce.batch.jobs.BatchJobException;



public class CreateUpdateDBJobTest {	

	final static String dataSource = "jdbc:mysql://localhost:3306/mysql";
	final static String dbSchema = "cpp_11";
	final static String dbUser = "root";
	final static String dbPassowrd = "P@yware1";
	static String[] sqlConParams = { dataSource, dbUser, dbPassowrd };
	static String accessKey = "AKIAJFGK447NGWTMUVMA";
	static String secretKey = "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";
	static String env = "dev";
	static String bucket = "verifone-cg-db-scripts";
	static String fromVersion = "V1_1_0_0";
	static String toVersion = "V2_0_0_39";
	static String zip = "dev/sql_scripts.zip";
	BatchJob sut;

	  @Before
      public void createDatabaseFromScratch() throws BatchJobException{
			sut = new CreateUpdateDBJob();
			String scratch = "true";
			String[] params = {"CreateUpdateDBJob",dataSource,dbSchema,dbUser,dbPassowrd,
					accessKey,secretKey,env,bucket,scratch,"none",zip}; 
			sut.execute(params);			  
     }


	
	// @Test
/*	public void createDatabaseToVersionFixed() throws BatchJobException{

		String scratch = "true";
		String[] params = {"CreateUpdateDBJob",dataSource,dbSchema,dbUser,dbPassowrd,
				accessKey,secretKey,env,bucket,scratch,"V2_0_0_5",zip}; 
		sut.execute(params);	
	}
	
	@Test
	public void createDatabaseToVersionNoneFixed() throws BatchJobException{

		String scratch = "true";
		String[] params = {"CreateUpdateDBJob",dataSource,dbSchema,dbUser,dbPassowrd,
				accessKey,secretKey,env,bucket,scratch,"none",zip}; 
		sut.execute(params);	
	}

	
	@Test
	public void updateDatabaseFromFixedVersion() throws BatchJobException{
		String scratch = "false";	
		String[] params = {"CreateUpdateDBJob",dataSource,dbSchema,dbUser,dbPassowrd,
				accessKey,secretKey,env,bucket,scratch,"V1_0_0_4",zip}; 
		sut.execute(params);	
	}*/
	
	@Test
	public void updateDatabaseFromNoneFixedVersion() throws BatchJobException{
		sut = new CreateUpdateDBJob();
		String scratch = "false";	
		String[] params = {"CreateUpdateDBJob",dataSource,dbSchema,dbUser,dbPassowrd,
				accessKey,secretKey,env,bucket,scratch,"none",zip}; 
		sut.execute(params);	
	}	




}
