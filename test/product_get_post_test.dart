import 'package:flutter_test/flutter_test.dart';
import 'package:jumia_gh_api/Objects/Metric.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'package:jumia_gh_api/jumia_gh_api.dart';

import 'test_values.dart';







Future main() async{
  Jumia api = Jumia(apikey, userId);


  test('Testing get products', () async{
    List<Product> products = await api.getProducts();
    expect(products[0].name, "Galaxy Bluetooth Ear Bud - White");
  });

  test('Testing get orders', () async{
    List<Order> products = await api.getOrders();
    expect(products[0].customerFirstName, "azmath");
  });

  test('Testing get payouts', () async{
    List<Payout> products = await api.getPayoutStatements();
    expect(products[0].subsidy, 0);
  });

  test('Testing get metrics', () async{
    Map<String, Metric> products = await api.getMetrics();
    expect(products['alltime']!.orderCount, 34);
  });




  // assert('test' == apikey);
}