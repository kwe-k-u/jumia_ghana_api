import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:jumia_gh_api/Objects/Brand.dart';
import 'package:jumia_gh_api/Objects/Category.dart';
import 'package:jumia_gh_api/Objects/Feed.dart';
import 'package:jumia_gh_api/Objects/FeedCount.dart';
import 'package:jumia_gh_api/Objects/Metric.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'package:jumia_gh_api/Objects/QcStatus.dart';
import 'package:jumia_gh_api/Objects/Role.dart';
import 'package:jumia_gh_api/Objects/ShipmentProvider.dart';
import 'package:jumia_gh_api/Objects/Statistics.dart';
import 'package:jumia_gh_api/jumia_gh_api.dart';

import 'test_values.dart';







Future main() async{
  Jumia api = Jumia(apikey, userId);


  test(' get products', () async{
    List<Product> products = await api.getProducts();
    expect(products[0].name, "Galaxy Bluetooth Ear Bud - White");
  });

  test(' get orders', () async{
    List<Order> products = await api.getOrders();
    expect(products[0].customerFirstName, "azmath");
  });

  test(' get order with id', () async{
    Order order = await api.getOrder(spoof["GetOrders"]!["OrderId"]);
    expect(order.customerFirstName, "azmath");
  });

  test(' get payouts', () async{
    List<Payout> products = await api.getPayoutStatements();
    expect(products[0].subsidy, 0);
  });

  test(' get metrics', () async{
    Map<String, Metric> products = await api.getMetrics();
    expect(products['alltime']!.orderCount, 34);
  });

  test(' get statistics', () async{
    Statistics stat = await api.getStatistics();
    expect(stat.orderPendingOlder, 0);
  });

  //todo the call takes extremely long to complete(Jumia's server speed?)
  // test(' get brands', () async{
  //   List<Brand> brand = await api.getBrands();
  //   expect(brand[0].id, 15516);
  // }, timeout: Timeout(Duration(minutes: 3)));

  test(' get shipment providers', () async{
    List<ShipmentProvider> brand = await api.getShipmentProviders();
    expect(brand[0].name, "GH-3PL NE Legon VDO-Station");
  });

  test(' get create user', () async{

    Response response = await api.createUser();
    expect(response.body.contains("ErrorResponse"), true);
    // an error response is expected for this because the account already exists
  });

  test(' user role update', () async{

    Response response = await api.updateUserRole(email :secondEmail, newRole: Role.Full_Access);
    expect(response.body.contains("SuccessResponse"), true);
  });



  test(' feed count', () async{
    FeedCount stat = await api.feedCount();
    expect(stat.canceled, 0);
  });

  test ("Get Qc Status", () async {
    List<QcStatus> status = await api.getQcStatus();
    expect(status.length, 0);

  });


  test(" get category tree", () async{
    List<Category> list = await api.getCategoryTree();

    expect(list[0].name, "Automobile");
    expect(list[0].categoryId, 1020696);
    expect(list[0].children![0].children![0].name, "Cleaning Kits");
  });


  //
  // test(' feed status', () async{
  //   List<Feed> stat = await api.feedStatus();
  //   expect(stat.canceled, 0);
  // });


  // test(' feed list', () async{
  //   List<Feed> list = await api.feedList();
  //   //no expect checks because the account may not always have a feed list
  // });


}

