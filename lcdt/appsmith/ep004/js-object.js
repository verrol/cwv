export default {
  urlBase: 'http://10.10.100.98:8090/api/collections',
  currentTab: 'signIn',
  setCurrentTab(tabName) {
    this.currentTab = tabName;
  },
  async doLogin() {
    await storeValue('userEmail', 'foo@email.com');
  }
}