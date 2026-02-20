package com.api.automation.mocks;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.mockserver.model.MediaType;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.mockserver.client.MockServerClient;
import org.mockserver.model.HttpRequest;
import org.mockserver.model.HttpResponse;
import org.mockserver.model.Parameter;
import org.mockserver.netty.MockServer;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

@TestInstance(Lifecycle.PER_CLASS)
public class TestProductCompositeParallelRunner {
	
	//1. Setup Method -> @BeforeAll --> Mock Server & Mock Client
	//2. Tear Down --> @AfterAll --> Shutdown the mock server & client
	//3. Test Method --> @Test (junit) --> Parallel runner to run the feature file
	//4. MockProductService --> Intercept the request going to product service and response with mock response
	//5. MockReviewService --> Intercept the request going to review service and response with mock response
	
	private MockServer server;
	private MockServerClient client;
	
	@BeforeAll
	public void setup() {
		server = new MockServer(9092);
		client = new MockServerClient("localhost", server.getLocalPort());
	}
	
	@Test
    void testParallel() {
		mockProductService();
		mockReviewService();
        Results results = Runner.path("classpath:com/api/automation/mocks")
//	        	.tags("@confidence, @smoke, @regression") //Comma = OR
//    			.tags("@confidence", "@smoke", "@regression") // Separate args = AND
                .outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
	
	@AfterAll
	public void teadDown() {
		if (server.isRunning()) server.stop();
		if (!client.hasStarted()) client.stop();
	}
	
	private void mockProductService() {

	    String body = "{\n" +
	            "  \"name\": \"name-123\",\n" +
	            "  \"weight\": 123,\n" +
	            "  \"productID\": 123\n" +
	            "}";

	    HttpRequest interceptReq = HttpRequest.request()
	            .withMethod("GET")
	            .withPath("/product/123");

	    HttpResponse mockResponse = HttpResponse.response(body)
	            .withHeader("Content-Type", "application/json");

	    client.when(interceptReq).respond(mockResponse);
	}
	
	private void mockReviewService() {

	    String body = "[\n" +
	            "  {\n" +
	            "    \"productId\": 123,\n" +
	            "    \"reviewId\": 456,\n" +
	            "    \"author\": \"John\",\n" +
	            "    \"subject\": \"Good\",\n" +
	            "    \"content\": \"This is a good product\"\n" +
	            "  },\n" +
	            "  {\n" +
	            "    \"productId\": 123,\n" +
	            "    \"reviewId\": 741,\n" +
	            "    \"author\": \"Todd\",\n" +
	            "    \"subject\": \"Very Good\",\n" +
	            "    \"content\": \"This is a fantastic product\"\n" +
	            "  }\n" +
	            "]";

	    HttpRequest interceptReq = HttpRequest.request()
	            .withMethod("GET")
	            .withPath("/review/123");

	    HttpResponse mockResponse = HttpResponse.response(body)
	            .withHeader("Content-Type", "application/json");

	    client.when(interceptReq).respond(mockResponse);
	}
	
}
