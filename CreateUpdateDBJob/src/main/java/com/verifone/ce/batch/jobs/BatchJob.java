package com.verifone.ce.batch.jobs;

public interface BatchJob {
	void execute(String[] args) throws BatchJobException;
}
