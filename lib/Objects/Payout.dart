class Payout {
  late String _statementNumber;
  late DateTime _dateCreated;
  late DateTime _dateUpdated;
  late double _openingBalance;
  late double _itemRevenue;
  late double _shipmentFee;
  late double _shipmentFeeCredit;
  late double _feesTotal;
  late double _subTotal;
  late double _subTotal2;
  late double _guarantee;
  late double _refundFee;
  late double _closingBalance;
  late bool _status;
  late double _refund;
  late double _subsidy;
  late double _subsidyRefund;
  late String _paymentReference;
  late double _payoutAmount;



  Payout(
      this._statementNumber,
      this._dateCreated,
      this._dateUpdated,
      this._openingBalance,
      this._itemRevenue,
      this._shipmentFee,
      this._shipmentFeeCredit,
      this._feesTotal,
      this._subTotal,
      this._subTotal2,
      this._guarantee,
      this._refundFee,
      this._closingBalance,
      this._status,
      this._refund,
      this._subsidy,
      this._subsidyRefund,
      this._paymentReference,
      this._payoutAmount,
      );

  Payout.fromJson(Map<String, dynamic> map){

    if (map["CreatedAt"]! != "")
      this._dateCreated = DateTime.parse(map["CreatedAt"]);

    if (map["UpdatedAt"]! != "")
    this._dateUpdated = DateTime.parse(map["UpdatedAt"]);

    this._statementNumber = map["StatementNumber"];
    this._openingBalance = double.parse(map["OpeningBalance"]);
    this._itemRevenue = double.parse(map["ItemRevenue"]);
    this._shipmentFee = double.parse(map["ShipmentFee"]);
    this._shipmentFeeCredit = double.parse(map["ShipmentFeeCredit"]);
    this._feesTotal = double.parse(map["FeesTotal"]);
    this._subTotal = double.parse(map["Subtotal1"]);
    this._subTotal2 = double.parse(map["Subtotal2"]);
    this._guarantee = double.parse(map["GuaranteeDeposit"]);
    this._refundFee = double.parse( map["FeesOnRefundsTotal"]);
    this._closingBalance = double.parse(map["ClosingBalance"]);
    this._status = map["Paid"] == "1";
    this._refund = double.parse(map["Refunds"]);
    this._subsidy = double.parse(map["Subsidy"]);
    this._subsidyRefund = double.parse(map["SubsidyRefund"]);
    this._paymentReference = map["PaymentReference"];
    this._payoutAmount = double.parse(map["Payout"].split(" ")[0]);
  }





  //getters
  String get statementNumber => this._statementNumber;
  DateTime get dateCreated => this._dateCreated;
  DateTime get dateUpdated => this._dateUpdated;
  double get openingBalance => this._openingBalance;
  double get itemRevenue => this._itemRevenue;
  double get shipmentFee => this._shipmentFee;
  double get shipmentFeeCredit => this._shipmentFeeCredit;
  double get feeTotal => this._feesTotal;
  double get subTotal => this._subTotal;
  double get subTotal2 => this._subTotal2;
  double get guaranteeDeposit => this._guarantee;
  double get refundFee => this._refundFee;
  double get closingBalance => this._closingBalance;
  bool get status => this._status;
  double get refund => this._refund;
  double get subsidy => this._subsidy;
  double get subsidyRefund => this._subsidyRefund;
  String get paymentReference => this._paymentReference;
  double get payoutAmount => this._payoutAmount;

  //setters
  set statementNumber(String? number) => this._statementNumber = number ?? "";
  set dateCreated(DateTime date) => this._dateCreated = date;
  set dateUpdated(DateTime date) => this._dateUpdated = date;
  set openingBalance(double? number) => this._openingBalance = number ?? 0.0;
  set itemRevenue(double? revenue) => this._itemRevenue = revenue ?? 0.0;

  set shipmentFeeCredit(double? value) {
    _shipmentFeeCredit = value ?? 0.0;
  }

  set feesTotal(double? value) {
    _feesTotal = value ?? 0.0;
  }

  set subTotal(double? value) {
    _subTotal = value ?? 0.0;
  }

  set subTotal2(double? value) {
    _subTotal2 = value ?? 0.0;
  }

  set shipmentFee(double? value) {
    _shipmentFee = value ?? 0.0;
  }

  set guarantee(double? value) {
    _guarantee = value ?? 0.0;
  }

  set refundFee(double? value) {
    _refundFee = value ?? 0.0;
  }

  set closingBalance(double? value) {
    _closingBalance = value ?? 0.0;
  }

  set status(bool? value) {
    _status = value ?? false;
  }

  set refund(double? value) {
    _refund = value ?? 0.0;
  }

  set subsidy(double? value) {
    _subsidy = value ?? 0.0;
  }

  set subsidyRefund(double? value) {
    _subsidyRefund = value ?? 0.0;
  }

  set paymentReference(String? value) {
    _paymentReference = value ?? "";
  }

  set payoutAmount(double? value) {
    _payoutAmount = value ?? 0.0;
  }



}
