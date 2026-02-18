package com.api.automation.patchrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestUpdateJobDescriptionRunner {
	
	@Test
	public Karate runTest() {
//		return Karate.run("getRequest", "responseMatcher").relativeTo(getClass());
		return Karate.run("update-job-description").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
//	}
	
}
