
import 'package:jumia_gh_api/Objects/Address.dart';



class Order{
  late String _orderId;
  late String _firstName;
  late String _lastName;
  late String _orderNumber;
  late String _paymentMethod;
  late String _remarks;
  late double _price;
  late DateTime _dateCreatedAt;
  late DateTime _dateUpdatedAt;
  late String _status;
  late Address _addressBilling;
  late int _itemCount;

  //these values exits to support extra detail attainment from 'getOrderItems' call
  String? _productId; //todo restructure and implement getters and getters
  String? _productName;
  String? _productSku;
  double? _taxAmount;
  double? _amountPaid;
  String? _shipmentProvider;
  String? _trackingCode;
  String? _purchaseId;
  String? _purchaseOrderNumber;
  String? _packageId;
  bool? _isDigital;
  String? _shippingProviderType;
  
  
  
  //getters
  String get orderId => this._orderId;
  String get customerFirstName => this._firstName;
  String get customerLastName => this._lastName;
  String get orderNumber => this._orderNumber;
  String get paymentMethod => this._paymentMethod;
  String get remarks => this._remarks;
  double get price => this._price;
  DateTime get createdAt => this._dateCreatedAt;
  DateTime get updatedAt => this._dateUpdatedAt;
  String get status => this._status;
  Address get billingAddress => this._addressBilling;
  int get itemCount => this._itemCount;


  //setters
  set orderId(String id) => this._orderId = id;
  set customerFirstName(String name) => this._firstName = name;
  set customerLastName(String name) => this._lastName = name;
  set orderNumber(String order) => this._orderNumber = order;
  set paymentMethod (String payment) => this._paymentMethod = payment;
  set price(double price) => this._price = price;
  set remarks (String remark) => this._remarks = remark;
  set createdAt(DateTime date) => _dateCreatedAt = date;
  set updatedAt(DateTime date) => this._dateUpdatedAt = date;
  set status(String status) => this._status = status;
  set location(Address location) => this._addressBilling = location;
  set itemCount(int count )=> this._itemCount = count;


  Order.fromJson(Map<String, dynamic> map){
    orderId = map["OrderId"];
    customerFirstName = map["CustomerFirstName"];
    customerLastName = map["CustomerLastName"];
    orderNumber = map["OrderNumber"];
    paymentMethod = map["PaymentMethod"];
    remarks = map["Remarks"];
    createdAt = DateTime.parse(map["CreatedAt"]);
    updatedAt = DateTime.parse(map["UpdatedAt"]);
    price = map["Price"];
    status = map["Statuses"]["Status"];
    location = Address.fromJson(map['AddressBilling']);
    itemCount = map["ItemsCount"];
  }

  
  
  
  
  
}