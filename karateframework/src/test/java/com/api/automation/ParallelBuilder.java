package com.api.automation;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import com.intuit.karate.junit5.Karate;

public class ParallelBuilder {
	
//	not working
//	@Test
//	public void executeKarateTest1() {
//		Builder aRunner = new Builder();
//		aRunner.path("classpath:com/api/automation");
//		aRunner.parallel(5);
//	}
	
//	working as junit test
//	not working for parallel on cmd mvn test
//	@Karate.Test
//    Results executeKarateTest2() {
//        return Karate.run("classpath:com/api/automation")
//        		.parallel(5);
//    }
	
	@Test // Standard JUnit 5 annotation
    void testParallel() {
        Results results = Runner.path("classpath:com/api/automation")
	        		.tags("@confidence, @smoke, @regression") //Comma = OR
//    			.tags("@confidence", "@smoke", "@regression") // Separate args = AND
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
