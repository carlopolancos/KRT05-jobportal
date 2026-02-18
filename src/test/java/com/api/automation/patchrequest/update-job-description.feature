Feature: To test the patch end point for updating the job description
	PATCH /normal/webapi/update/details
	
	Scenario: To update the job description for newly added job entry
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		
		Given url baseUrl
		And path 'normal/webapi/update/details'
		* def newJobDescription = 'Whasdhsadhasdhasd qeuqeu!'
		And params { id: '#(randomId)', jobTitle: 'Software Engg', jobDescription: '#(newJobDescription)' }
		When method patch
		Then status 200
		And response.jobId == randomId
	
	Scenario: To update the job description for newly added job entry with non-existing id
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		
		Given url baseUrl
		And path 'normal/webapi/update/details'
		* def newJobDescription = 'Whasdhsadhasdhasd qeuqeu!'
		* def fakeId = 9999
		And params { id: '#(fakeId)', jobTitle: 'Software Engg', jobDescription: '#(newJobDescription)' }
		When method patch
		Then status 404
		And match response.message == 'Failed to find job with id='+fakeId
	
	Scenario: To update the job description for newly added job entry without job title
		* def baseUrl = 'http://localhost:9897'
		
		* def getRandomValue = function() { return Math.floor( (100)*Math.random() ); }
		* def randomId = getRandomValue()
		* def createJob = call read('classpath:com/api/automation/create-job-entry-with-variables.feature') { _url: '#(baseUrl)', _path: 'normal/webapi/add', _id: '#(randomId)' }
		
		Given url baseUrl
		And path 'normal/webapi/update/details'
		* def newJobDescription = 'Whasdhsadhasdhasd qeuqeu!'
		And params { id: '#(randomId)', jobTitle: 'Software Engg'}
		When method patch
		Then status 400
		And match response.message == "Required String parameter 'jobDescription' is not present"