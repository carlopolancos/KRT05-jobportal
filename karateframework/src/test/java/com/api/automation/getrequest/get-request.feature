Feature: To test the get end point of the application
	To test different get end point with different data format supported by the application
	
	Background: Setup the Base path
		Given url 'http://localhost:9191'
		* print '==========This is background keyword=========='

	Scenario: To get all the data from application in JSON format
		Given path 'normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200

	Scenario: To get all the data from application in XML format
		Given path 'normal/webapi/all'
		And header Accept = 'application/xml'
		When method get
		Then status 200