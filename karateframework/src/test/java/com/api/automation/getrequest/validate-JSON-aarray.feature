Feature: To validate the GET End point
	To validate the get end point response
	
	Background: Setup the Base path
		Given url 'http://localhost:9191'

	Scenario: To get and validate the data in JSON format
		Given path 'normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		#match specific properties
		And match response[0].jobId == 1
		And match response[0].experience[1] == 'Apple'
		And match response[0].project[0].projectName == 'Movie App'
		And match response[0].project[0].technology[2] == 'Gradle'
		#match array size
		And match response[0].experience == '#[3]'
		And match response[0].project[0].technology == '#3'
		#match whole property using wild card, ORDER IS IMPORTANT
		And match response[0].experience[*] == ["Google","Apple","Mobile Iron"]
		And match response[0].experience == ["Google","Apple","Mobile Iron"]
		And match response[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
		#contains keyword
		And match response[0].experience[*] contains "Mobile Iron","Apple"
		And match response[0].experience contains "Google"
		And match response[0].project[0].technology[*] contains "SQL Lite"
		And match response[*].jobId contains 1

	Scenario: To get and validate the data in JSON format and validate using Fuzzy Matcher
		Given path 'normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		#match specific properties
		And match response.[0].jobId == "#present"
		And match response.[0].experience[1] == '#notnull'
		And match response.[0].project[0].projectName == '#ignore'
		And match response.[0].project[0].technology == '#array'
		And match response.[0].jobTitle == "#string"
		And match response.[0].jobId == "#number"
		#Complex fuzzy matcher
		And match response.[0].jobId == '#? _ >= 1'
		And match response.[0].jobTitle == '#string? _.length >= 1'
		And match response.[0].jobTitle == '#string? _.length != 1'
		#To validate the array
		And match response.[0].experience == '#[]'
		And match response.[0].experience == '#[3]'
		And match response.[0].experience == '#[3] #string'
		And match response.[0].experience == '#[3] #string? _.length >= 5'