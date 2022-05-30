package com.verifone.ce.batch.jobs.activeterminal;

import java.io.File;

import org.junit.Test;



public class OrderFilesTest {
	
	@Test
	public void reorderFilesBeforeDirectoriesTest(){
		File f = new File("C:/Projects_DB/dev/cgdatabase/sql_scripts/V2_0_0_09");
		File[] fileArr = f.listFiles();
		printFiles(fileArr);
		fileArr = reorderFilesBeforeDirectories( fileArr);
		printFiles(fileArr);
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
	
	void printFiles(File[] files) {
		System.out.println("---------------------------");
		for(int i=0;i<files.length;i++){
			System.out.println(files[i].getName());
		}
	}
	
	

}
