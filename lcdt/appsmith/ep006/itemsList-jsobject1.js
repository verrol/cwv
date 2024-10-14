export default {
	confirmSignedIn () {
		if (!appsmith.store.authToken){
			navigateTo('authPage');
		}
	}
}