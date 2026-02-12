Feature: To test the updation of Job entry in the test application
	Test the end point PUT /normal/webapi/update
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9191'
		* def newJobBody = read('classpath:com/api/automation/job-entry.json')
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		
	Scenario: To update the Job Entry for existing job in JSON format
		#Create a new Job Entry
		Given path 'normal/webapi/add'
		* def id = getRandomValue()
		* set newJobBody.jobId = id
		
		And request newJobBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status 201
		
		#Update entry
		Given path 'normal/webapi/update'
		* set newJobBody.jobTitle = 'Bagong titulo'
		* set newJobBody.jobDescription = 'Bagong deskripsyon'
		* set newJobBody.project[0].projectName = 'Bagong pangalan ng proyekto'
		And request newJobBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method put
		Then status 200
		And match response == newJobBody