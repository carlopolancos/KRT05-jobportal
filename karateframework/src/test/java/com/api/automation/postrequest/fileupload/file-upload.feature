Feature: To upload the file using Karate Framework
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9191'
		
	Scenario: To upload in the test application
		Given path 'normal/webapi/upload'
		#file location, name, content-type header value
		* def fileName = 'FileToUpload.txt'
		And multipart file file = { read:'#(fileName)', filename:'#(fileName)', Content-Type: 'multipart/form-data' }
		When method post
		Then status 200
		* print response
		And match response.message contains fileName
		
	Scenario: To upload in the test application with JSON data
		Given path 'normal/webapi/upload'
		#file location, name, content-type header value
		* def fileName = 'job-entry.json'
		* def fileLocation = '../../'+fileName
		And multipart file file = { read:'#(fileLocation)', filename:'#(fileName)', Content-Type: 'multipart/form-data' }
		When method post
		Then status 200
		* print response
		And match response.message contains fileName