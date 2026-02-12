Feature: To use the JSON path expresison
	
	Background: Setup the Base path
		Given url 'http://localhost:9191'
		
	Scenario: To the the value of property using json path expression
		Given path 'normal/webapi/all'
		When method get
		Then status 200
		# karate.jsonPath(doc.json-path-expression)
		* def jobId = 81
		* def jobTitle = karate.jsonPath(response, "$[?(@.jobId == "+jobId+")].jobTitle")
		* def jobDescription = karate.jsonPath(response, "$[?(@.jobId == "+jobId+")].jobDescription")
		* def experience = karate.jsonPath(response, "$[?(@.jobId == "+jobId+")].experience")
		* print "Job Title: " + jobTitle
		* print "Job Description: " + jobDescription
		* print "Experience: " + experience