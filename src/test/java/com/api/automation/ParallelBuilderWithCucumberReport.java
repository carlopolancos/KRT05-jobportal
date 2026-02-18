package com.api.automation;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {
	
	@Test // Standard JUnit 5 annotation
    void testParallel() {
        Results results = Runner.path("classpath:com/api/automation")
	        		.tags("@confidence, @smoke, @regression") //Comma = OR
//				.tags("@confidence", "@smoke", "@regression") // Separate args = AND
                .outputCucumberJson(true)
                .parallel(5);
        generateCucumberReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
	
     void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation);
        Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] {"json"}, true);
        
        List<String> jsonFiles = new ArrayList<String>();
        jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
        
        Configuration configuration = new Configuration(reportDir, "Karate Run");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        reportBuilder.generateReports();
    }
}
