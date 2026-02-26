@confidence
Feature: To test the GET end point which is secured with Basic Auth
	GET secure/webapi/all
	
	Background: Setup the Base path
		Given url 'http://localhost:9897'
		* def expectedJsonResponse = read('classpath:com/api/automation/json-response.json')

	Scenario: To access the GET end point with basic auth using valid credentials
		Given path 'secure/webapi/all'
		And headers { Accept: 'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ==' }
		When method get
		Then status 200
		And match each response.[*] == expectedJsonResponse

	Scenario: To access the GET end point without basic auth using no credentials
		Given path 'secure/webapi/all'
		And headers { Accept: 'application/json'}
		When method get
		Then status 401
		And match response contains 'HTTP Status 401 : Full authentication is required to access this resource'

	Scenario: To access the GET end point with basic auth using invalid credentials
		Given path 'secure/webapi/all'
		And headers { Accept: 'application/json', Authorization: 'Basic YXV0aG9yOndlbGNvbWUx' }
		When method get
		Then status 401
		And match response contains 'HTTP Status 401 : Bad credentials'

	Scenario: To access the GET end point with basic auth via js function using valid credentials
		Given path 'secure/webapi/all'
		* def auth = call read('classpath:com/api/automation/basic-auth.js') { username: 'admin', password: 'welcome' }
		And headers { Accept: 'application/json', Authorization: '#(auth)' }
		When method get
		Then status 200
		And match each response.[*] == expectedJsonResponse

	Scenario: To access the GET end point with basic auth via js function using invalid credentials
		Given path 'secure/webapi/all'
		* def auth = call read('classpath:com/api/automation/basic-auth.js') { username: 'author', password: 'welcome1' }
		And headers { Accept: 'application/json', Authorization: '#(auth)' }
		When method get
		Then status 401
		And match response contains 'HTTP Status 401 : Bad credentials'