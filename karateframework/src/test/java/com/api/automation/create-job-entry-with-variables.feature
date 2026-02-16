Feature: To create the job entry in the test application
	Helper file for post /normal/webapi/add
		
	Scenario: Create job in JSON format using passed variable values
		Given url _url
		And path _path
		* def newJobBody = read('classpath:com/api/automation/job-entry.json')
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def id = getRandomValue()
		* set newJobBody.jobId = _id
		
		And request newJobBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status 201