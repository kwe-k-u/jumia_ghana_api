

import 'package:flutter/cupertino.dart';

class Category{
  late String name;
  late int categoryId;
  late int? globalIdentifier;
  late List<Category>? children;


  Category.fromJson(Map<String, dynamic> map){
    name = map["Name"];
    categoryId = int.parse(map["CategoryId"]);

    if (map["GlobalIdentifier"] != "")
    globalIdentifier = int.parse(map["GlobalIdentifier"]);

    if (map["Children"] != "") {
      children = [];
      if (map["Children"]["Category"].runtimeType == [].runtimeType ) {
        for (var m in (map["Children"]["Category"] as List<dynamic>))
          children!.add(Category.fromJson(m));
      }
      else if (map["Children"]["Category"].runtimeType == {}.runtimeType )
        children!.add(Category.fromJson(map["Children"]["Category"]));
    }
  }
}