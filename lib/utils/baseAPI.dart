
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
  Uri _linkBuilder({
    required String action,
    String? orderId,
    DateTime? createdAfter,
    String? orderItemId,
    String? reason,
    String? reasonDetail,
    String? shippingProvider,
    String? deliveryType,
    String? orderItemIds,
    String? trackingNumber,
    String? accessKey,
    String? serialNumber,
    String? invoiceEncodedXml,
    String? documentURl,
  }){

    ///Method to add all the extra parameters that a request may require
     String _params(){
       String _result = "";

       ///Appends the parameter to the result string
       void _append(String param, String value) => _result +="&$param=$value";


       if (orderId != null)
         _append("OrderId", orderId);
       if (orderItemId != null)
         _append("OrderItemId", orderItemId);

       if (createdAfter != null)
         _append("CreatedAfter", _parseDate(createdAfter));
       if (reason != null)
         _append("Reason", reason);
       if(reasonDetail != null)
         _append("ReasonDetail", reasonDetail);



       return _result;
     }




    String actionString = "Action=" + action;
    String url = "https://sellercenter-api.jumia.com.gh/?" + actionString;
    String format = "&Format=JSON";
    String time = "&Timestamp=" + __getTime();


    String userId = "&UserID=" + __getUserID();
    String version = "&Version=" + __getApiVersion();



    ///This section makes special additions to the link if needed
    String signature = "&Signature=" + __signRequest(actionString, format, time, userId, version, _params());

    url += format + _params() + time + userId + version + signature;
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


  ///Returns the current time formatted for url encoding
  String __getTime() {

    DateTime now = DateTime.now();
    DateTime currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second);
    return _parseDate(currentTime);
  }


  ///Formats a time sequence for the api url
  String _parseDate(DateTime date){
    String dateString = _parseString(date.toIso8601String());
    dateString = dateString.substring(0, dateString.length -1) + "%3A00";
    return dateString;
  }


  ///Encodes the [string] into url-utf8 format. (replacing . with %2B)
  String _parseString(String string){
    String result = Uri.encodeQueryComponent(string);
    result = result.replaceAll(".", "%2B");
    return result;
  }


  ///A POST function that posts the passed [body] to the Jumia endpoint
  ///[extra] is a json to contain any addition parameters tthat need to be passed along in the request
  Future<http.Response> post({
    Map<String, dynamic> extra = const {},
    required String action,
    String? body
  }) async{
    Uri url = _linkBuilder(
        action: action,
      orderId: extra["orderId"] as String,
      createdAfter: extra["createAfter"] as DateTime,
      orderItemId: extra["orderItemId"] as String,
      reason: extra["reason"] as String,
      reasonDetail: extra["reasonDetail"] as String,
      shippingProvider: extra["shippingProvider"] as String,
      orderItemIds: _parseString(extra["orderItemsIds"].toString()), //todo check if causes error
      deliveryType:  extra["deliveryType"],
      trackingNumber: extra["trackingNumber"],
      serialNumber: extra["serialNumber"],
      accessKey: extra["accessKey"],
      invoiceEncodedXml: extra["invoiceEncodeXml"],
      documentURl: extra["documentUrl"]
    );
    http.Response data = await http.post(url, body: body);

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