Feature: To create job in the test application
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9191'
		* def newJsonRequestBody = read('classpath:com/api/automation/job-entry.json')
		
	Scenario Outline: To create job description in the test application <method>
		Given print '<url>'
		And print '<path>'
		When print '<method>'
		Then print <status>
		Examples:
		| url 					| path 				 	| method		| status		|
		| http://localhost:9191 	| normal/webapi/all/ 	| get 		| 200 		|
		| http://localhost:9191 	| normal/webapi/add/ 	| post 		| 201 		|
		| http://localhost:9191 	| normal/webapi/add/ 	| put 		| 201 		|
	
	Scenario Outline: Data Driven for the job description entry using file reader and JSON modifer <jobId>
		Given path 'normal/webapi/add'
		* set newJsonRequestBody.jobId = '<jobId>'
		* set newJsonRequestBody.jobTitle = '<jobTitle>'
		* set newJsonRequestBody.jobDescription = '<jobDescription>'
		And request newJsonRequestBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status <status>
		Examples:
		| jobId 	| jobTitle 			| jobDescription 					| status	|
		| 9980 	| Software Engg - 2 	| To develop android application 	| 201 	|
		| id 	| Software Engg - 2 	| To develop android application 	| 400 	|
		| false 	| Software Engg - 2 	| To develop android application 	| 400 	|
	
	Scenario Outline: Data Driven for the job description entry using feeder <jobId>
		Given path 'normal/webapi/add'
		* set newJsonRequestBody.jobId = '<jobId>'
		* set newJsonRequestBody.jobTitle = '<jobTitle>'
		* set newJsonRequestBody.jobDescription = '<jobDescription>'
		And request newJsonRequestBody
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		When method post
		Then status <status>
		Examples:
		| read('classpath:com/api/automation/postrequest/datadriven/test_data.csv') | 
