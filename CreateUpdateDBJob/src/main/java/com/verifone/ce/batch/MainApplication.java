package com.verifone.ce.batch;

import com.verifone.ce.batch.jobs.BatchJob;
import com.verifone.ce.batch.jobs.activeterminal.CreateUpdateDBJob;

public class MainApplication {

	public static void main(String[] args) {
		System.out.println("Batch job started");
		if (args.length == 0 && !args[0].equals("CreateUpdateDBJob")) {
			System.err.println("Batch job name is not specified");
			System.exit(-1);
		}

		BatchJob batchJob = new CreateUpdateDBJob();

		// Execute job
		try {
			batchJob.execute(args);
		} catch (Exception ex) {
			System.out.println("Batch job has been executed with errors");
			System.err.println(ex.getMessage());
			System.exit(-1);
		}
		System.out.println("Batch job has been executed succesfully");
		System.exit(0);
	}

}
