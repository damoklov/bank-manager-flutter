class BankManagerData {
  final String id;
  final String bankName;
  final String credential;
  final double value;
  final int cardNumber;
  final int cvv;

  BankManagerData(
      {this.id = "1",
      this.bankName = "cd",
      this.value = 0.9,
      this.cardNumber = 1112223330621756,
      this.cvv = 123,
      this.credential = "Vlad Usyk"});
}
