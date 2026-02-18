/*not working
function auth(cred) {
	var info = cred.username + ':' + cred.password;
	var base64 = Java.type('java.util.Base64');
	var encodedStr = base64.getEncoder().encodeToString(info.bytes);
	return 'Basic ' + encodedStr;	
}*/

function auth(cred) {
    var info = cred.username + ':' + cred.password;
    var Base64 = Java.type('java.util.Base64');
    // This converts the JS string to a Java string and calls getBytes safely
    var infoBytes = Java.type('java.lang.String').valueOf(info).getBytes('UTF-8');
    var encodedStr = Base64.getEncoder().encodeToString(infoBytes);
    return 'Basic ' + encodedStr;    
}

/*function auth(cred) {
    var temp = cred.username + ':' + cred.password;
    var Base64 = karate.toBase64(temp);
    return 'Basic ' + Base64;
}*/