library jumia_gh_api;

import 'package:http/http.dart' as http;
import 'package:jumia_gh_api/Objects/Brand.dart';
import 'package:jumia_gh_api/Objects/Category.dart';
import 'package:jumia_gh_api/Objects/Feed.dart';
import 'package:jumia_gh_api/Objects/FeedCount.dart';
import 'package:jumia_gh_api/Objects/Metric.dart';
import 'package:jumia_gh_api/Objects/Order.dart';
import 'package:jumia_gh_api/Objects/OrderComment.dart';
import 'package:jumia_gh_api/Objects/Payout.dart';
import 'package:jumia_gh_api/Objects/Product.dart';
import 'package:jumia_gh_api/Objects/QcStatus.dart';
import 'package:jumia_gh_api/Objects/Role.dart';
import 'package:jumia_gh_api/Objects/ShipmentProvider.dart';
import 'package:jumia_gh_api/Objects/Statistics.dart';
import 'package:jumia_gh_api/utils/baseAPI.dart';
import 'package:jumia_gh_api/utils/resources.dart';
import 'package:xml/xml.dart' as xmlBuild;





class Jumia extends BaseAPI{
  Jumia(String apiKey, String userID) : super(apiKey, userID);


  ///Returns a list of products in the current user's store
  Future<List<Product>> getProducts() async{
    List<Product> products = [];

    //access the list of product maps from the json
    List< dynamic > map =
    ( await get(action: 'GetProducts') )["Body"]["Products"]["Product"] ;
    //adding the products to the list

    for(Map<String, dynamic> sub in map) {
        products.add(Product.fromJson(sub));
    }


    return products;
  }

  ///Returns a list of orders for the current user's store
  Future<List<Order>> getOrders() async{//todo add createdAfter parameter
    List<Order> orders = [];

    //access the list of orders maps from the json
    List< dynamic > map =
    ( await get(action: 'GetOrders') )["Body"]["Orders"]["Order"];

    //adding the orders to the list
    for(Map<String, dynamic> sub in map)
      orders.add(Order.fromJson(sub));

    return orders;
  }

  ///Returns the order in the store with the passed order [id]
  Future<Order> getOrder(String id) async{
    Order order;

    Map<String,dynamic> map =
    ( await get(action: 'GetOrder', id: id) )["Body"]["Orders"]["Order"];

    order = Order.fromJson(map);

    return order;
  }


  ///Returns the comments made on the order with the passed [id]
  Future<List<OrderComment>> getOrderComments(String id) async{
    List<OrderComment> comment = [];


    //todo add a test and error handling
    List< dynamic > map =
    ( await get(action: 'GetOrderComments', id: id) )["Body"]["Comments"]["Comment"];

    //adding the orders to the list
    for(Map<String, dynamic> sub in map)
      comment.add(OrderComment.fromJson(sub));


    return comment;
  }


  ///Returns a statistic object on the performance and help of the account
  Future<Statistics> getStatistics() async{
    Statistics stat;

    Map<String,dynamic> map =
    ( await get(action: 'GetStatistics') )["Body"];
    stat = Statistics.fromJson(map);
    return stat;
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

  ///Returns a list of brands allowed on jumia
  Future<List<Brand>> getBrands() async{
    List<Brand> brands = [];

    //access the list of brands maps from the json
    List<dynamic> map =
    ( await get(action: 'GetBrands') )["Body"]["Brands"]["Brand"];

    //adding the brands to the list
    for(Map<String, dynamic> sub in map)
      brands.add(Brand.fromJson(sub));

    return brands;
  }

  ///Returns a list of shipment providers for jumia
  Future<List<ShipmentProvider>> getShipmentProviders() async{
    List<ShipmentProvider> provider = [];

    //access the list of provider maps from the json
    List<dynamic> map =
    ( await get(action: 'GetShipmentProviders') )["Body"]["ShipmentProviders"]["ShipmentProvider"];

    //adding the providers to the list
    for(Map<String, dynamic> sub in map)
      provider.add(ShipmentProvider.fromJson(sub));

    return provider;
  }


  ///Creates a user account to manage the store to which the api key belongs
  Future<http.Response> createUser() async{
    final xml = xmlBuild.XmlBuilder();
    xml.processing("xml", 'version="1.0" encoding="UTF-8"');
    xml.element("Request",
        nest: (){
          xml.element("User",
              nest: (){
                xml.element("Role",
                    nest: "Seller API Access");
                xml.element("Email",
                    nest: "kwekuappiah11@gmail.com");
                xml.element("Status",
                    nest: "active");
                xml.element("Name",
                    nest: "Kweku Acquaye");
                xml.element("DefaultLanguage",
                    nest: "English");
                xml.element("NotifyNewUser",
                    nest: 1);
              });
        });

    // return xml.buildDocument().toXmlString();

    http.Response response = await post(action:"UserCreate",body: xml.buildDocument().toString());
    return response;
  }


  ///Creates a user account to manage the store to which the api key belongs
  Future<http.Response> updateUserRole({required String email, required Role newRole}) async{
    final xml = xmlBuild.XmlBuilder();
    xml.processing("xml", 'version="1.0" encoding="UTF-8"');
    xml.element("Request",
        nest: (){
          xml.element("User",
              nest: (){
                xml.element("Role",
                    nest: parseRole(newRole));
                xml.element("Email",
                    nest: email);
              });
        });

    // return xml.buildDocument().toXmlString();

    http.Response response = await post(
        action: "UserRoleUpdate",
        body: xml.buildDocument().toString());
    return response;
  }



  ///Updates the Images that exist for the passed product skus
  /// the passed data([map]) is a key-value per where the key is the product sku
  /// and the value is a list of urls for the image;
  Future<http.Response> productImage(Map<String,List<String>> map) async{
    final xml = xmlBuild.XmlBuilder();
    xml.processing("xml", 'version="1.0" encoding="UTF-8"');
    xml.element("Request",
        nest: (){
          xml.element("ProductImage",
              nest: (){

                for(String sku in map.keys){
                  xml.element("SellerSku",
                    nest: (){

                      xml.element("Images",
                        nest: (){
                          for(String url in map[sku]!){
                            xml.element("Image", nest: url);
                          }
                        },
                      );
                    },
                  );

                }


              });
        });

    // return xml.buildDocument().toXmlString();

    http.Response response = await post(
        action: "Image",
        body: xml.buildDocument().toString()
    );
    return response;
  }
//todo create test with singleImage, multiple products and multiple images




  ///Removes the products with list of skus passed
  Future<http.Response> productRemove(List<String> products) async{
    final xml = xmlBuild.XmlBuilder();
    xml.processing("xml", 'version="1.0" encoding="UTF-8"');
    xml.element("Request",
        nest: (){
          xml.element("Product",
              nest: (){

                for(String sku in products){
                  xml.element("SellerSku",
                    nest: sku
                  );
                }
              });
        });


    http.Response response = await post(
        action:"ProductRemove",
        body:xml.buildDocument().toString()
    );
    return response;
  }
//todo create test



  ///Returns the Feed count statistics for the store
  Future<FeedCount> feedCount() async{
    FeedCount feed;

    Map<String,dynamic> map =
    ( await get(action: 'FeedCount') )["Body"]["FeedCount"];

    feed = FeedCount.fromJson(map);


    return feed;
  }




  ///Returns a list of the active feeds for the user
  Future<List<Feed>> feedList() async{
    List<Feed> feed = [];

    //access the list of feed maps from the json
    List<dynamic> map =
    ( await get(action: 'FeedList') )["Body"];

    //adding the feeds to the list
    for(Map<String, dynamic> sub in map)
      feed.add(Feed.fromJson(sub));

    return feed;
  }


  ///Returns a list of the active feeds for the user
  Future<List<Feed>> feedStatus() async{
    List<Feed> feed = [];

    //access the list of feed maps from the json
    List<dynamic> map =
    ( await get(action: 'FeedStatus') )["Body"];

    //adding the feeds to the list
    for(Map<String, dynamic> sub in map)
      feed.add(Feed.fromJson(sub));

    return feed;
  }

  ///Returns a list of the active feeds for the user
  Future<List<Category>> getCategoryTree() async{
    List<Category> list = [];

    //access the list of feed maps from the json
    List<dynamic> map =
    ( await get(action: 'GetCategoryTree') )["Body"]["Categories"]["Category"];

    //adding the feeds to the list
    for(Map<String, dynamic> sub in map)
      list.add(Category.fromJson(sub));

    return list;
  }

  Future<List<QcStatus>> getQcStatus () async {
    List<QcStatus> list = [];

    //access the list of feed maps from the json
    List<dynamic> map =
    ( await get(action: 'GetQcStatus') )["Body"]["Status"];

    //adding the feeds to the list
    for(Map<String, dynamic> sub in map)
      list.add(QcStatus.fromJson(sub));

    return list;

  }








}