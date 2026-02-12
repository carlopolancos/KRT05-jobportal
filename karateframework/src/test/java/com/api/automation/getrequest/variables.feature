Feature: Variables Creation in Karate Framework

	#<Gherkin Keyword> <def> <variable_name> = <value>
	Background: Create and initialize variables
		* def app_name = "Google"
		* def page_load_timeout = 20
	
	Scenario: To create a variable
		#Use variable for repeating value
		#Storing the data from an external file
		#In the matcher expression
		#Passing the data from one feature file to another
		
		* def var_int = 10
		* def var_string = 'Karate'
		* print "Int Variable: ", var_int
		* print "String Variable: ", var_string 
		
		* def var_int_2 = var_int + 10
		* print "New Variable: ", var_int_2
		* print "Feature Background Variables: ", app_name, page_load_timeout
	
	Scenario: To create a variable
		* def var_int = 1
		* def var_string = 'Karate'
		* def var_int_2 = 90
		
		* print "Int Variable: ", var_int
		* print "String Variable: ", var_string 
		* print "New Variable: ", var_int_2
		* print "Feature Background Variables: ", app_name, page_load_timeout