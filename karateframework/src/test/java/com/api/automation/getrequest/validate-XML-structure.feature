Feature: To validate the GET End point
	To validate the get end point response
	
	Background: Setup the Base path
		Given url 'http://localhost:9191'

	Scenario: To get and validate the data in XML format
		Given path 'normal/webapi/all'
		And header Accept = 'application/xml'
		When method get
		Then status 200
		#match specific properties
		And match response/List/item/jobId contains '1'
		And match response/List/item/jobTitle contains 'Software Engg'
		And match response/List/item/experience/experience[1] contains 'Google'
		And match response/List/item/project/project/projectName contains 'Movie App'
		And match response/List/item/project/project/technology/technology[2] contains 'SQL Lite'
		#skip the response keyword
		And match /List/item/experience/experience[1] contains 'Google'
		#traverse the xml similar to json
		#And match response.List.item.experience.experience[0] contains 'Google'
		#And match response..experience.experience[0] contains 'Google'

	Scenario: To get and validate the data in XML format and validate using fuzzy matcher
		Given path 'normal/webapi/all'
		And header Accept = 'application/xml'
		When method get
		Then status 200
		#match specific properties
		And match response/List/item/jobId == '#notnull'
#		And match response/List/item/jobTitle == '#string'
#		And match response/List/item/jobTitle == '#[] #string'
		And match response/List/item/jobTitle == "#? karate.typeOf(_) == 'string' || karate.typeOf(_) == 'list'"
		And match response/List/item/experience/experience[1] == '#notnull'
		And match response/List/item/project/project/projectName == '#present'
		And match response/List/item/project/project/technology/technology[2] == '#ignore'
		#Complex fuzzy matcher
		And match response/List/item[1]/jobTitle == '#string? _.length == 13'
			#element id attribute
		And match response/List/item/jobTitle.id == '#notpresent'
		