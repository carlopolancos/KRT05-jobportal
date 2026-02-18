Feature: To get the variables set by karate-config.js file
	
	Background: To get the value of myVarName
		* def localmyVarName = myVarName
		* print "Background Variable value: " + localmyVarName
	
	Scenario: To get the value of username and password from karate-config.js
		* def localusername = username
		* print "Scenario Variable value: " + localusername
		* print "Scenario Variable value: " + password