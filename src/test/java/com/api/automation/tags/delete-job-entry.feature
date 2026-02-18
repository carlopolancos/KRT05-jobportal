Feature: To test the delete end point
	DELETE normal/webapi/remove/{id}
	
	@smoke
	Scenario: To update the job description for newly added job entry
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		
		#delete the job
		Given url baseUrl
		And path 'normal/webapi/remove/' + randomId
		When method delete
		Then status 200
		And response.jobId == randomId
		
		#verify job is deleted
		Given path 'normal/webapi/find'
		* def fixedJobTitle = 'Software Engg'
		And params { id: '#(randomId)', jobTitle: '#(fixedJobTitle)'}
		And header Accept = 'application/json'
		When method get
		Then status 404
		And match response.message == 'Failed to find job with id='+randomId+', jobTitle='+fixedJobTitle
	
	@regression
	Scenario: To update the job description for newly added job entry and delete job entry twice
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		
		#delete the job
		Given url baseUrl
		And path 'normal/webapi/remove/' + randomId
		When method delete
		Then status 200
		And response.jobId == randomId
		
		#delete the job
		Given url baseUrl
		And path 'normal/webapi/remove/' + randomId
		When method delete
		Then status 404
		And response.message == 'Entry with id = '+randomId+' not found'
	
	Scenario: To update the job description for newly added job entry and delete job entry twice
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		* def newJobId = createJob.responseJobId
		* def newJobTitle = createJob.responseJobTitle
		
		#patch
		Given url baseUrl
		And path 'normal/webapi/update/details'
		* def newJobDescription = 'Basta bagong deskripsyon!'
		And params { id: '#(newJobId)', jobTitle: '#(newJobTitle)', jobDescription: '#(newJobDescription)' }
		When method patch
		Then status 200
		And response.jobId == newJobId
		And response.jobTitle == newJobTitle
		
		#verify job is deleted
		Given path 'normal/webapi/find'
		And params { id: '#(newJobId)', jobTitle: '#(newJobTitle)'}
		And header Accept = 'application/json'
		When method get
		Then status 200
		And match response.jobDescription == newJobDescription