
import 'package:jumia_gh_api/Objects/OrderComment.dart';
import 'package:jumia_gh_api/Objects/Role.dart';
import 'package:xml/xml.dart' as xmlBuilder;
import 'package:jumia_gh_api/Objects/ShipmentProvider.dart';

dynamic parseDeliveryOption(dynamic data){
  if (data.runtimeType == String ){
    switch(data.toLowerCase()){
      case "express":
        return DeliveryOption.express;
      case "economy":
        return DeliveryOption.economy;
      case 'standard':
        return DeliveryOption.standard;
    }
  }
  else if(data.runtimeType == String){
    return data.toString().split(".")[1];

  } else {
    List<DeliveryOption> list = [];
    for (var e in data)
      list.add(parseDeliveryOption(e));
  }
}


///Returns a string/role representation of the entered [role].
///If [role] has a type of Role, a string is returned and vice versa
 dynamic parseRole(dynamic role){
  //return the Role object representation of role
  if(role.runtimeType == String){
    switch(role){
      case "Seller Full Access":
        return Role.Full_Access;
      case "Seller Catalog_Access":
        return Role.Catalog_Access;
      case "Seller API Access":
        return Role.API_Access;
      case "Seller Order Access":
        return Role.Order_Access;
      case "Seller API Product Access":
        return Role.API_Product_Access;
      case "Seller API Order Access":
        return Role.API_Order_Access;
    }
  } else {
    //return the string representation of the role
    return "Seller ${role.toString().split(".")[1].replaceAll("_", " ")}";
  }
}



///Returns a string/role representation of the entered [role].
///If [role] has a type of Role, a string is returned and vice versa
dynamic parseCommentType(dynamic type){
  //return the Role object representation of role
  if(type.runtimeType == String){
    switch(type.toLowerCase()){
      case "refund":
        return CommentType.refund;
      case "action_required":
        return CommentType.action_required;
      case "information_only":
        return CommentType.information_only;
    }
  } else {
    //return the string representation of the role
    return type.toString().split(".")[1];
  }
}


//todo make universal xml builder