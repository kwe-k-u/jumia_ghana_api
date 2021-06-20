import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:jumia_gh_api/Objects/Address.dart';
import 'package:jumia_gh_api/Objects/Brand.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'package:jumia_gh_api/Objects/ShipmentProvider.dart';
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



}