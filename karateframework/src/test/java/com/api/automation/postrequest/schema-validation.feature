Feature: Validate the JSON schema
	To validate the JSON schema for POST /normal/webapi/add
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9191'
		* def body = read("classpath:com/api/automation/job-entry.json")
		* def expectedResponse = read("classpath:com/api/automation/json-response.json")
		
	Scenario: To create the Job Entry in JSON format
		Given path 'normal/webapi/add'
		And request body
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status 201
		And match response == expectedResponse
		
	Scenario: Schema Validation for GET end point
		Given path 'normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		
		* def projectSchema = { "projectName":"#string", "technology":"#[] #string" }
		* def mainSchema = { "jobId": "#number", "jobTitle":"#string", "jobDescription":"#string", "experience": "#[] #string", "project": "#[] ##(projectSchema)" }
		
		And match response == "#[] ##(mainSchema)"