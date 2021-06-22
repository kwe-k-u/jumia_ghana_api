import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:jumia_gh_api/Objects/Address.dart';
import 'package:jumia_gh_api/Objects/Brand.dart';
import 'package:jumia_gh_api/Objects/FeedCount.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'package:jumia_gh_api/Objects/ShipmentProvider.dart';
import 'package:jumia_gh_api/Objects/Statistics.dart';
import 'test_values.dart';

@Skip("The objects will be created in the test 'product_get_post_test'")
void main(){


  //testing address class
  test("testing the address class", (){
    Address address = Address.fromJson(spoof['GetOrders']!["AddressBilling"]);

    expect(address.city, "Abelemkpe");
  });

  //testing order class
  test("testing the order class", (){
    Order order = Order.fromJson(spoof['GetOrders']!);
    expect(order.price, 385);
  });

  //testing product class
  test("testing the product class", (){
    Product product = Product.fromJson(spoof['GetProducts']!);

    expect(product.name, "Galaxy Bluetooth Ear Bud - White");
  });

  //testing brand class
  test("testing the brand class", (){
    Brand brand = Brand.fromJson(spoof["GetBrands"]!);
    expect(brand.id, 15516);
  });

  //testing shipmentProvider class
  test("testing the shipmentProvider class", (){
    ShipmentProvider provider = ShipmentProvider.fromJson(spoof["GetShipmentProviders"]!);
    expect(provider.name, "GH-3PL NE Legon VDO-Station");
  });


  test("testing the statistics class", (){
    Statistics stat = Statistics.fromJson(spoof["GetStatistics"]!);
    expect(stat.orderPendingOlder, 0);
    expect(stat.orderStatistics.standard, 0);
    expect(stat.accountHealth.dayHealth.twoDayPercentage.value, 0.0);
  });



  test('testing feed count', (){
    FeedCount feed = FeedCount.fromJson(spoof["FeedCount"]!);
    expect(feed.total, 0);
  });




}