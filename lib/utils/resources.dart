
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


// String parseToXml(){ // Use when product is created afresh
//   final xml = xmlBuilder.XmlBuilder();
//   xml.processing("xml", 'version="1.0" encoding="UTF-8"');
//   xml.element("Request",
//       nest: (){
//         xml.element("Product",
//             nest: (){
//               if (getDescription() != "")
//                 xml.element("Description",
//                     nest: getDescription());
//               if (getBrand() != "")
//                 xml.element("Brand",
//                     nest: getBrand());
//               xml.element("Status",
//                   nest: getStatus());
//               if (getName() != "")
//                 xml.element("Name",
//                     nest: getName());
//               if (getPrice() != 0.0)
//                 xml.element("Price",
//                     nest: getPrice());
//               if (getPrimaryCategory() != "")
//                 xml.element("PrimaryCategory",
//                     nest: getPrimaryCategory());
//               if (getCategoryId() != "")
//                 xml.element("PrimaryCategoryId",
//                     nest: getCategoryId());
//               if (getSellerSku() != "")
//                 xml.element("SellerSku",
//                     nest: getSellerSku());
//               if (getTaxClass() != "" )
//                 xml.element("TaxClass",
//                     nest: getTaxClass());
//               if (getSalePrice()  != 0.0)
//                 xml.element("SalePrice",
//                     nest: getSalePrice());
//               if (getSaleStartDate().toString() != "")
//                 xml.element("SaleStartDate",
//                     nest:  "${getSaleStartDate()} ${getSaleStartTime()}"  );
//               if (getSaleEndDate().toString() != "")
//                 xml.element("SaleEndDate",
//                     nest: "${getSaleEndDate()} ${getSaleEndTime()}" );
//               xml.element("Condition",
//                   nest: "new");
//               xml.element("Quantity",
//                   nest: getAvailable());
//
//             });
//       });
//
//   //todo figure out how images are added
//   //Image api call
// }
//todo make universal