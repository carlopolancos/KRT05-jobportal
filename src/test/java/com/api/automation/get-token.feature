Feature: To get the JWT token for the user

	Scenario: Register the user and generate the token
		#Register the user
		Given url 'http://localhost:9898'
		Given path 'users/sign-up'
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		And request { username: '#(_username)', password: '#(_password)'}
		When method post
		Then status 200
		And match response == _username+' register successfully'
		
		#Get the token
		Given path 'users/authenticate'
		And headers { Accept: 'application/json', Content-Type: 'application/json' }
		And request { username: '#(_username)', password: '#(_password)'}
		When method post
		Then status 200
		* def authToken = response.token
		* print 'Token is '+authToken