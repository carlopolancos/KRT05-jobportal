@regression
Feature: To send the get request with JWT token
	GET http://localhost:9898/auth/webapi/all
	
	Background: Setup base path and file to read
		Given url 'http://localhost:9898'
		Given path 'auth/webapi/all'
		* def expectedJsonResponse = read('classpath:com/api/automation/json-response.json')
		* def token = call read('classpath:com/api/automation/get-token.feature') { _username: 'carlo', _password: 'polancos' }
		
	Scenario: Send the GET request with JWT token
		And headers { Accept: 'application/json', Authorization: "#('Bearer ' + token.authToken)" }
		When method get
		Then status 200
		And match each response.[*] == expectedJsonResponse
		
	Scenario: Send the GET request without JWT token
		And headers { Accept: 'application/json'}
		When method get
		Then status 401
		And match response.message == 'Unauthorized'