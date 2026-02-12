Feature: To create the Job entry in the application
	Use POST /normal/webapi/add to create job entry in the application
	
	Background: Setup the Base path
		Given url 'http://localhost:9191'
		* def newJsonRequestBody = read('classpath:com/api/automation/job-entry.json')
		* def newXmlRequestBody = read('classpath:com/api/automation/xml-entry.xml')

	#Send and receive JSON
	Scenario: To create the Job Entry in JSON format
		Given path 'normal/webapi/add'
		And request newJsonRequestBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status 201
		And match response.jobTitle == newJsonRequestBody.jobTitle

	#Send XML and receive JSON
	Scenario: To create the Job Entry in XML format
		Given path 'normal/webapi/add'
		And request newXmlRequestBody
		And headers { Accept: 'application/json', Content-Type: 'application/xml' }
		When method post
		Then status 201	
		* def sentId = karate.xmlPath(newXmlRequestBody, '/item/jobId')
		And match response.jobId == sentId * 1

	#Send and receive XML
	Scenario: To create the Job Entry in XML format
		Given path 'normal/webapi/add'
		And request newXmlRequestBody
		And headers { Accept: 'application/xml', Content-Type: 'application/xml' }
		When method post
		Then status 201	
		# Use karate.xmlPath to safely extract the value
		* def sentId = karate.xmlPath(newXmlRequestBody, '/item/jobId')
		And match response/Job/jobId == sentId