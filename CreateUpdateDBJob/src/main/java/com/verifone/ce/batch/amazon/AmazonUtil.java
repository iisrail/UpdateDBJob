package com.verifone.ce.batch.amazon;

import java.io.InputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ListObjectsV2Request;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public class AmazonUtil {
	private AmazonS3 s3Client;

	private final static Logger log = LoggerFactory.getLogger(AmazonUtil.class.getName());

	public AmazonUtil(String accessKey, String secretKey) {
		if (accessKey.length() == 20 && secretKey.length() == 40) {
			s3Client = new AmazonS3Client(new BasicAWSCredentials(accessKey, secretKey));
		} else {
			// Get credentials from IMDS. If unsuccessful, get them from the classpath.
			AWSCredentialsProvider credentialsProvider = null;
			try {
				credentialsProvider = new InstanceProfileCredentialsProvider();
				// Verify we can fetch credentials from the provider
				credentialsProvider.getCredentials();
				log.info("Obtained credentials from the IMDS.");
			} catch (AmazonClientException e) {
				log.info("Unable to obtain credentials from the IMDS, trying classpath properties");
				credentialsProvider = new ClasspathPropertiesFileCredentialsProvider();
				try {
					// Verify we can fetch credentials from the provider
					credentialsProvider.getCredentials();
					log.info("Obtained credentials from the properties file.");
				} catch (Exception e2) {
					log.info("Unable to obtain credentials from the classpath properties, trying '.aws/credentials' folder ");
					credentialsProvider = new ProfileCredentialsProvider();
					log.info("Obtained credentials from '.aws/credentials' folder");
				}
			}
			log.info("Using credentials with access key id: "
					+ credentialsProvider.getCredentials().getAWSAccessKeyId());
			s3Client = new AmazonS3Client(credentialsProvider.getCredentials());
			
		}

	}

	public InputStream getS3ObjectContent(String bucketName, String key)
			throws AmazonClientException {
		try {
			log.debug("Downloading the object");
			S3Object s3object = s3Client.getObject(new GetObjectRequest(bucketName, key));
			log.debug("Content-Type: " + s3object.getObjectMetadata().getContentType());
			return s3object.getObjectContent();
		} catch (AmazonClientException e) {
			throw e;
		}
	}


	public void handleAmazonException(AmazonClientException ace) {
		if (ace instanceof AmazonServiceException) {
			AmazonServiceException ase = (AmazonServiceException) ace;
			log.error("Caught an AmazonServiceException, " + "which means your request made it "
					+ "to Amazon S3, but was rejected with an error " + "response for some reason.");
			log.error("Error Message:    " + ase.getMessage());
			log.error("HTTP Status Code: " + ase.getStatusCode());
			log.error("AWS Error Code:   " + ase.getErrorCode());
			log.error("Error Type:       " + ase.getErrorType());
			log.error("Request ID:       " + ase.getRequestId());
		} else {
			log.error("Caught an AmazonClientException, " + "which means the client encountered "
					+ "an internal error while trying to " + " communicate with S3, "
					+ "such as not being able to access the network.");
			log.error("Error Message: " + ace.getMessage());
		}
	}

}
