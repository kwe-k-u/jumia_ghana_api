library jumia_gh_api;

import 'package:jumia_gh_api/Objects/Metric.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'package:jumia_gh_api/utils/baseAPI.dart';





class Jumia extends BaseAPI{
  Jumia(String apiKey, String userID) : super(apiKey, userID);


  ///Returns a list of products in the current user's store
  Future<List<Product>> getProducts() async{
    List<Product> products = [];

    //access the list of product maps from the json
    List< dynamic > map =
    ( await get(action: 'GetProducts') )["Body"]["Products"]["Product"];

    //adding the products to the list
    for(Map<String, dynamic> sub in map)
      products.add(Product.fromJson(sub));

    return products;
  }

  ///Returns a list of orders for the current user's store
  Future<List<Order>> getOrders() async{
    List<Order> orders = [];

    //access the list of orders maps from the json
    List< dynamic > map =
    ( await get(action: 'GetOrders') )["Body"]["Orders"]["Order"];

    //adding the orders to the list
    for(Map<String, dynamic> sub in map)
      orders.add(Order.fromJson(sub));

    return orders;
  }

  ///Returns a list of payout statements for the current user's store
  Future<List<Payout>> getPayoutStatements() async{
    List<Payout> payouts = [];

    //access the list of payout maps from the json
    List< dynamic > map =
    ( await get(action: 'GetPayoutStatus') )["Body"]["PayoutStatus"]["Statement"];

    //adding the statements to the list
    for(Map<String, dynamic> sub in map)
      payouts.add(Payout.fromJson(sub));

    return payouts;
  }

  ///Returns the metrics for the current user's store
  Future<Map<String, Metric>> getMetrics() async{
    Map<String, Metric> metrics = {};

    //access the list of metric maps from the json
    List< dynamic > map =
    ( await get(action: 'GetMetrics') )["Body"]["Metrics"]["MetricsType"];

    //adding the metrics to the map
    for(Map<String, dynamic> sub in map)
      metrics[sub["StatisticsType"]] = Metric.fromJson(sub);

    return metrics;
  }


}