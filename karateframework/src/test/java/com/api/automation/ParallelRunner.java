package com.api.automation;

import org.junit.jupiter.api.Assertions;

import com.intuit.karate.Results;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ParallelRunner {
	
	
//	all not working
//	@Test
//	public void executeKarateTests() {
//      Runner.parallel(getClass(), 5);
//	}

//	@Test
//	public void executeKarateTests() {
//		Builder aRunner = new Builder();
//		aRunner.path("classpath:com/api/automation");
//		aRunner.parallel(5);
//		Runner.parallel(aRunner);
//	}

//	@Test
//	public void executeKarateTests() {
//		Builder aRunner = new Builder();
//		aRunner.path("classpath:com/api/automation");
//		Results result = aRunner.parallel(5);
//		
//		System.out.println("Total Feature: " + result.getFeatureCount());
//		System.out.println("Total Scenarios: " + result.getScenarioCount());
//		System.out.println("Passed Scenarios: " + result.getPassCount());
//		
//		Assertions.assertEquals(0, result.getFailCount(), "There are some failed scenarios.");
//	}

}
