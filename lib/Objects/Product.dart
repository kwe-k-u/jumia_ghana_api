

class Product{
  late String _sellerSku;
  late String _shopSku;
  late String _name;
  late String _parentSku;
  late String _brand;
  late String _description;
  late String _taxClass;
  late String _variation;
  late int _quantity;
  late int _available;
  late double _price;
  double? _salePrice;
  DateTime? _saleStartDate;
  DateTime? _saleEndDate;
  late String _url;
  List<String>? _imageUrls;
  late String _primaryCategory;
  late String _primaryCategoryId;
  String? _categories;
  late String _status;
  String? _productId;


  //getters
  String get name => this._name;
  String get sellerSku => this._sellerSku;
  String get shopSku => this._shopSku;
  String get parentSku => this._parentSku;
  String get brand => this._brand;
  String get status => this._status;
  String get description => this._description;
  String get taxClass => this._taxClass;
  String get variation => this._variation;
  int get quantity => this._quantity;
  int get available => this._available;
  double get price => this._price;
  double get salePrice => this._salePrice ?? 0.0;
  DateTime? get saleStartDate => this._saleStartDate;
  DateTime? get saleEndDate => this._saleEndDate;
  String get url => this._url;
  List<String>? get imageUrls => this._imageUrls;
  String get primaryCategory => this._primaryCategory;
  String get primaryCategoryId => this._primaryCategoryId;
  String? get categories => this._categories;
  String? get productId => this._productId;




  //setters
  set name(String n) => this._name = n;
  set sellerSku(String sku) => this._sellerSku = sku;
  set parentSku(String parentSku) => this._parentSku = parentSku;
  set shopSku(String sku) => this._shopSku = sku;
  set brand(String b) => this._brand = b;
  set description(String des)=> this._description = description;
  set taxClass(String tax)=> this._taxClass = tax;
  set variation(String variation) => this._variation = variation;
  set quantity(int quan)=> this._quantity = quan; //todo throw exception when quantity is negative
  set available(int avail) => this._available = avail;
  set salePrice(double price) => this._salePrice = price;
  set saleStartDate(DateTime? date) => this._saleStartDate = date;//todo exception if start date is after end date
  set saleEndDate(DateTime? date) => this._saleEndDate = date;
  set primaryCategory(String category) => this._primaryCategory = category;
  set primaryCategoryId(String id) => this._primaryCategoryId = id;
  set category(String cat) => this._categories = cat;
  set price(double price) => this._price = price;
  set status(String status) => this._status = status;
  set productId(String? id) => this._productId = id;
  set url(String url) => this._url = url;
  //todo add setters for the image


  Product.fromJson(Map<String, dynamic> map){
    shopSku = map["ShopSku"];
    name = map["Name"];
    sellerSku = map["SellerSku"];
    variation = map["Variation"];
    parentSku = map["ParentSku"];
    quantity = map["Quantity"];
    available = map["Available"];
    price = map["Price"];
    salePrice = map["SalePrice"];
    saleStartDate = DateTime.parse(map["SaleStartDate"]);
    saleEndDate = DateTime.parse(map["SaleEndDate"]);
    status = map["Status"];
    productId = map["ProductId"];
    url = map["Url"];
    //todo main image and images
    description = map["Description"];
    taxClass = map["TaxClass"];
    brand = map["Brand"];
    primaryCategory = map["PrimaryCategory"];
    primaryCategoryId = map["PrimaryCategoryId"];
    //todo add product data
  }





}