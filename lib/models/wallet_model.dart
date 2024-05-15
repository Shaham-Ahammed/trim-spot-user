class WalletModel {
  final String shopName;
  final String date;
  final String action;
  final String amount;

  WalletModel(
      {required this.shopName,
      required this.date,
      required this.action,
      required this.amount});
}

// List<WalletModel> walletList = [
//   WalletModel(
//       shopName: "Haidor salons",
//       date: "25 MAY 2024",
//       action: "BOOKING",
//       amount: "100"),
//   WalletModel(
//       shopName: "Haidor salons",
//       date: "25 MAY 2024",
//       action: "REFUND",
//       amount: "100"),
// ];
