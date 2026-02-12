Feature: To exectue the Java Script Function
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9191'
		
	Scenario: Execute Java Script Function with and without parameter
		* def getIntValue = function() { return 10; }
		* print "Function Value: " + getIntValue()
		
		* def getRandomValue = function() { return Math.floor((100)*Math.random()); }
		* print "Random Function Value: " + getRandomValue()
		
		* def getStringValue = function(arg1) { return "Hello "+arg1 }
		* print "Hello String Function Value: " + getStringValue("Queque")