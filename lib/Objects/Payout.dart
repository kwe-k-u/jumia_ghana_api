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
    this._statementNumber = map["StatementNumber"];
    this._dateCreated = DateTime.parse(map["CreatedAt"]);
    this._dateUpdated = DateTime.parse(map["UpdatedAt"]);
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
    this._payoutAmount = double.parse(map["Payout"]);
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
  set statementNumber(String number) => this._statementNumber = number;
  set dateCreated(DateTime date) => this._dateCreated = date;
  set dateUpdated(DateTime date) => this._dateUpdated = date;
  set openingBalance(double number) => this._openingBalance = number;
  set itemRevenue(double revenue) => this._itemRevenue;

  set shipmentFeeCredit(double value) {
    _shipmentFeeCredit = value;
  }

  set feesTotal(double value) {
    _feesTotal = value;
  }

  set subTotal(double value) {
    _subTotal = value;
  }

  set subTotal2(double value) {
    _subTotal2 = value;
  }

  set shipmentFee(double value) {
    _shipmentFee = value;
  }

  set guarantee(double value) {
    _guarantee = value;
  }

  set refundFee(double value) {
    _refundFee = value;
  }

  set closingBalance(double value) {
    _closingBalance = value;
  }

  set status(bool value) {
    _status = value;
  }

  set refund(double value) {
    _refund = value;
  }

  set subsidy(double value) {
    _subsidy = value;
  }

  set subsidyRefund(double value) {
    _subsidyRefund = value;
  }

  set paymentReference(String value) {
    _paymentReference = value;
  }

  set payoutAmount(double value) {
    _payoutAmount = value;
  }



}
