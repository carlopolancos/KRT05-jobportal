Feature: To test the GET end point with Query Parameter
	GET /normal/webapi/find
	
	Scenario: Get data using Query Paramter
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		
		Given url baseUrl
		And path 'normal/webapi/find'
		And params { id: '#(randomId)', jobTitle: 'Software Engg' }
		And headers { Accept: 'application/json'}
		When method get
		Then status 200
		And response.jobId == randomId