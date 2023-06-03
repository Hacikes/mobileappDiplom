class MockAccountsList {

  MockAccountsList();

  static List<String> accountName = ['XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX',];
  static List<String> accountBroker = ['XXXXXXXXXX', 'XXXXXXXXXX', 'XXXXXXXXXX', 'XXXXXXXXXX',];
  static List<double> accountPrice = [0.0, 0.0, 0.0, 0.0,];


  static List<String> getMockAccountName() {
    return accountName;
  }

  static List<String> getMockAccountBroker() {
    return accountBroker;
  }

  static List<double> getMockAccountPrice() {
    return accountPrice;
  }

}