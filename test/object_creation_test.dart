import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:jumia_gh_api/Objects/Address.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'test_values.dart';

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

  //testing payout class
  test("testing the address class", (){
    Payout payout = Payout.fromJson(spoof["GetPayoutStatus"]!);
    expect(payout.shipmentFeeCredit, 0.0);
  });

}