Feature: To create the job entry in the test application
	Helper file for post /normal/webapi/add
	
	Background: Create and initialize setup
		Given url 'http://localhost:9897'
		And path 'normal/webapi/add'
		* def newJobBody = read('classpath:com/api/automation/job-entry.json')
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		
#	Scenario: Create job in JSON format using fixed value as jobId
#		* set newJobBody.jobId = 125
		
#		And request newJobBody
#		And headers { Accept: 'application/json', Content-Type: 'application/json' }
#		When method post
#		Then status 201
		
	Scenario: Create job in JSON format using random value as jobId
		* def id = getRandomValue()
		* set newJobBody.jobId = id
		
		And request newJobBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status 201