Feature: To validate the GET End point
	To validate the get end point response
	
	Background: Setup the Base path
		Given url 'http://localhost:9191'
		* def expectedJsonResponse = read('classpath:com/api/automation/json-response.json')
		* def expectedXmlResponse = read('classpath:com/api/automation/xml-response.xml')

	Scenario: To get the data in JSON format and validate from file
		Given path 'normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		* print response
		And match each response.[*] == expectedJsonResponse

	Scenario: To get the data in XML format and validate from file
		Given path 'normal/webapi/all'
		And header Accept = 'application/xml'
		When method get
		Then status 200
		* print response
		And match each response/List/item == expectedXmlResponse