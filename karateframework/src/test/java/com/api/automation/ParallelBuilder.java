package com.api.automation;

import com.intuit.karate.Results;
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
	
//	working
	@Karate.Test
    Results executeKarateTest2() {
        return Karate.run("classpath:com/api/automation").parallel(5);
    }
}
