

class Brand{
  late String _name;
  late int _id;
  late String _gIdentifier;


  Brand.fromJson(Map<String, dynamic> map){
    name = map["Name"];
    id = int.parse(map["BrandId"]);
    globalIdentifier = map["GlobalIdentifier"];
  }

//todo handle html error identifiers like &amp;layered

  //Getters
  String get name => this._name;
  int get id => this._id;
  String get globalIdentifier => this._gIdentifier;


  //Setters
  set name(String n) => this._name = n;
  set id(int id) => this._id = id;
  set globalIdentifier(String id) => this._gIdentifier = id;
}