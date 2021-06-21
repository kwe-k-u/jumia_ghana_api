
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class BaseAPI{
  final String _apiKey;
  final String _userID;

  BaseAPI(this._apiKey, this._userID);


  ///Uses Sha256 to generate the hash signature for the request
  String __signRequest(String action, String format, String timestamp, String userId, String version, [String orderId = ""]){

    String signature = action + format + orderId + timestamp + userId + version;

    //Encode the hash key
    var key = utf8.encode(_apiKey);

    var text = utf8.encode(signature);

    var hmacSha256 = new Hmac(sha256, key);

    //Create the hash sequence
    Digest sha256Result = hmacSha256.convert(text);
    signature = sha256Result.toString();

    return signature;
  }


  ///Generates a uri to the api endpoint based on the passed [action]
  Uri _linkBuilder({required String action, String? orderId}){
    String actionString = "Action=" + action;
    String url = "https://sellercenter-api.jumia.com.gh/?" + actionString;
    String format = "&Format=JSON";
    String time = "&Timestamp=" + __getTime();

    //adding order id if required
    if (orderId != null)
      orderId = "&OrderId=" + orderId;
    else
      orderId ="";

    String userId = "&UserID=" + __getUserID();
    String version = "&Version=" + __getApiVersion();



    ///This section makes special additions to the link if needed
    String signature = "&Signature=" + __signRequest(actionString, format, time, userId, version, orderId);

    url += format + orderId + time + userId + version + signature;
    return Uri.parse(url);

  }


  //Returns the api version being accessed
  String __getApiVersion(){
    String version = "1.0";
    return version;
  }



  ///Returns the user id formatted for url encoding
  String __getUserID(){
    String userID = _userID.replaceAll("@", "%40");
    return userID;
  }


  ///Formats the time sequence for the api url
  String __getTime() {

    DateTime now = DateTime.now();
    DateTime currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second);
    String currentTimeString = currentTime.toIso8601String().toString().replaceAll(":", "%3A");

    currentTimeString = currentTimeString.replaceAll(".", "%2B");
    currentTimeString = currentTimeString.replaceAll(" ", "");
    currentTimeString = currentTimeString.substring(0,currentTimeString.length-1) + "%3A00";
    return currentTimeString;
  }



  ///A POST function that posts the passed [body] to the Jumia endpoint
  Future<http.Response> post(String action, String body) async{
    Uri url = _linkBuilder(action: action);
    http.Response data = await http.post(url,body: body);

    return data;
  }



  ///A GET function that received data from the Jumia endpoint in json format
  Future<Map<String, dynamic>>get({String? id, required String action}) async {

    Uri url = _linkBuilder(action: action, orderId: id);
    http.Response data = await http.get(url);

    Map jsonMap = jsonDecode(data.body);
    var jsonContent = jsonMap["SuccessResponse"] ?? jsonMap["ErrorResponse"]["Head"];
    return jsonContent;
//todo throw error if result failed;
  }



}