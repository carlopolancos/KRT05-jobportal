package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestUpdateJobEntryRunner {
	
	@Test
	public Karate runTest() {
//		return Karate.run("getRequest", "responseMatcher").relativeTo(getClass());
//		return Karate.run().relativeTo(getClass());
		return Karate.run("update-job-entry").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
//	}
	
}
