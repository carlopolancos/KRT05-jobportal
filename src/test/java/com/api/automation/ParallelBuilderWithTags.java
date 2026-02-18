package com.api.automation;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

public class ParallelBuilderWithTags {
	
	//open this file's run configuration to edit tags
	
	/* Available tags:
	 * @confidence
	 * @smoke
	 * @regression
	 * 
	 * */
	
	private static final String CLASS_PATH = "classpath:";
	
//	@Karate.Test
//    Results executeKarateTest3() {
//        return Karate.run(getLocation().toArray(new String[0]))
//        		.tags(getTags())
//        		.tags("@confidence, @smoke, @regression") //Comma = OR
////        		.tags("@confidence", "@smoke", "@regression") // Separate args = AND
////        		.tags("@smoke, @confidence", "~@ignore") 
//        		.parallel(5);
//    }
	
	@Test // Standard JUnit 5 annotation
    void testParallel() {
        Results results = Runner.path(getLocation().toArray(new String[0]))
                .tags(getTags().toArray(new String[0]))
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
	
	private List<String> getTags() {
		String aTags = System.getProperty("tags", "@confidence, @smoke, @regression");
		List<String> aTagList = Arrays.asList(aTags);
		return aTagList;
	}

	private List<String> getLocation() {
		String aLocation = System.getProperty("location", "com/api/automation");
		List<String> aLocationList = Arrays.asList(CLASS_PATH+aLocation);
		return aLocationList;
	}
}
