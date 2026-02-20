package com.api.automation.mocks;

import org.junit.jupiter.api.BeforeAll;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestProductCompositeServiceRunner {
	
	@BeforeAll
	public void setup() {
		
	}
	
	@Test
	public Karate runTest() {
		return Karate.run("product-composite-service-test").relativeTo(getClass());
	}
	
}
