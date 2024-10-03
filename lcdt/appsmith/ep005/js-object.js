export default {
	urlBase: 'http://10.10.100.174:8090/api/collections',
	currentTab: 'signIn',
	setCurrentTab (tabName) {
		this.currentTab = tabName;
	},
	async doLogin () {
		const authUrl = this.urlBase + "/users/auth-with-password";
		
		const requestBody = JSON.stringify({
			identity: txtSignInEmail.text,
			password: txtSignInPassword.text,
		});
		
		const requestOptions = {
			method: "POST",
			headers:{
				"Content-Type": "application/json",
			},
			body: requestBody,
		};

		try{
			const response = await fetch(authUrl, requestOptions);
			if(!response.ok){
				throw new Error('unable to login: ${response.status}');
			}
			
			errorOutput.setText('');

			const body = await response.json();
			console.log("response status:", response.status);
			
			const jwt = body.token;
			const name = body.record.name;
			const email = body.record.email;

			storeValue('userFullname', name);
			storeValue('userEmail', email);
			storeValue('authToken', jwt);
		}catch(error){
			console.error(error.message);
			errorOutput.setText('Sign in failed, please try again.')
		}
	}
}