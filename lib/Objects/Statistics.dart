


import 'package:jumia_gh_api/Objects/AccountHealth.dart';
import 'package:jumia_gh_api/Objects/OrderStatistics.dart';

class Statistics{
  late int allProduct;
  late int productTotal; //I think jumia made a mistake with this and the preceeding value (it makes little sense to me at least)
  late int activeProductCount;
  late int deletedProductCount;
  late int imageMissingProductCount;
  late int inActiveProductCount;
  late int liveProductCount;
  late int pendingProductCount;
  late int poorQualityProductCount;
  late int soldOutProductCount;
  late int orderPendingToday;
  late int orderPendingYesterday;
  late int orderPendingOlder;
  late OrderStatistics orderStatistics;
  late AccountHealth accountHealth;


  Statistics.fromJson(Map<String, dynamic> map){
    productTotal = int.parse(map["Products"]["Total"]);
    activeProductCount = int.parse(map["Products"]["Status"]["Active"]);
    deletedProductCount = int.parse(map["Products"]["Status"]["Deleted"]);
    imageMissingProductCount = int.parse(map["Products"]["Status"]["ImageMissing"]);
    inActiveProductCount = int.parse(map["Products"]["Status"]["Inactive"]);
    liveProductCount = int.parse(map["Products"]["Status"]["Live"]);
    pendingProductCount = int.parse(map["Products"]["Status"]["Pending"]);
    poorQualityProductCount = int.parse(map["Products"]["Status"]["PoorQuality"]);
    soldOutProductCount = int.parse(map["Products"]["Status"]["SoldOut"]);
    orderPendingToday = int.parse(map["OrdersItemsPending"]["Today"]);
    orderPendingYesterday = int.parse(map["OrdersItemsPending"]["Yesterday"]);
    orderPendingOlder = int.parse(map["OrdersItemsPending"]["Older"]);

    orderStatistics = OrderStatistics.fromJson(map['Orders']);
    accountHealth = AccountHealth.fromJson(map["AccountHealth"]);

  }


}