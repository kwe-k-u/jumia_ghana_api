class Address {
  late String _firstName;
  late String _lastName;
  late String _phoneNumber;
  late String _phoneNumber2;
  late String _address1;
  late String _address2;
  late String _address3;
  late String _address4;
  late String _address5;
  late String _customerEmail;
  late String _city;
  late String _ward;
  late String _region;
  late String _postCode;
  late String _country;






  Address.fromJson(Map<String, dynamic> map) {
        firstName = map["FirstName"];
        lastName = map["LastName"];
        phoneNumber1 = map["Phone"];
        phoneNumber2 = map["Phone2"];
        address1 = map["Address1"];
        address2 = map["Address2"];
        address3 = map["Address3"];
        address4 = map["Address4"];
        address5 = map["Address5"];
        email = map["CustomerEmail"];
        city = map["City"];
        ward = map["Ward"];
        region = map["Region"];
        postCode = map["PostCode"];
        country = map["Country"];

  }

  Address(
      String? firstName,
      String? lastName,
      String? phoneNumber1,
      String? phoneNumber2,
      String? address1,
      String? address2,
      String? address3,
      String? address4,
      String? address5,
      String? customerEmail,
      String? city,
      String? ward,
      String? region,
      String? postCode,
      String? country){

    this.firstName = firstName;
    this.lastName = lastName;
    this.phoneNumber1 = phoneNumber1;
    this.phoneNumber2 = phoneNumber2;
    this.address1 = address1;
    this.address2 = address2;
    this.address3 = address3;
    this.address4 = address4;
    this.address5 = address5;
    this.email = customerEmail;
    this.city = city;
    this.ward = ward;
    this.region = region;
    this.postCode = postCode;
    this.country = country;
  }












  //getters
  String get firstName => this._firstName;
  String get lastName => this._lastName;
  String get phoneNumber1 => this._phoneNumber;
  String get phoneNumber2 => this._phoneNumber2;
  String get address1 => this._address1;
  String get address2 => this._address2;
  String get address3 => this._address3;
  String get address4 => this._address4;
  String get address5 => this._address5;
  String get email => this._customerEmail;
  String get city => this._city;
  String get ward => this._ward;
  String get postCode => this._postCode;
  String get region => this._region;
  String get country => this._country;

  //setters
  set firstName(String? firstName) => this._firstName = firstName ?? "";
  set lastName(String? lastName) => this._lastName = lastName ?? "";
  set phoneNumber1(String? number1) => this._phoneNumber = number1 ?? "";
  set phoneNumber2(String? number) => this._phoneNumber2 = number ?? "";
  set address1(String? address) => this._address1 = address ?? "";
  set address2(String? address) => this._address2 = address ?? "";
  set address3(String? address) => this._address3 = address ?? "";
  set address4(String? address) => this._address4 = address ?? "";
  set address5(String? address) => this._address5 = address ?? "";
  set email(String? email) => this._customerEmail = email ?? "";
  set city(String? city) => this._city = city ?? "";
  set ward(String? ward) => this._ward = ward ?? "";
  set region(String? region) => this._region = region ?? "";
  set country(String? country) => this._country = country ?? "";
  set postCode(String? postCode) => this._postCode = postCode ?? "";



}
