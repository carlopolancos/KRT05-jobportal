package com.api.automation.postrequest.fileupload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestFileUploadRunner {
	
	@Test
	public Karate runTest() {
//		return Karate.run("getRequest", "responseMatcher").relativeTo(getClass());
//		return Karate.run().relativeTo(getClass());
		return Karate.run("file-upload").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
//	}
	
}
