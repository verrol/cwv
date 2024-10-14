export default {
	confirmSignedIn () {
		let jwt = appsmith.store.authToken;
		console.log("jwt", jwt);
		if(!jwt){
			navigateTo('authPage');
		}
	},
	doSignOut(){
		// clear store and navigate to auth page
		clearStore();
		navigateTo('authPage');
	},
	getLabelNames(labels){
		// Use the map() method to extract the 'name' property from each element in the labels array
    const labelNames = labels.map(label => label.name);
    
    // Join all elements of the labelNames array into a single string, separated by commas
    return labelNames.join(', ');
	}
}