import 'package:jumia_gh_api/utils/resources.dart';

class ShipmentProvider {
  late String _name;
  late String _api;
  late String _default;
  late String _cod;
  late String _trackingRegex;
  late String _trackingExample;
  late String _trackingUrl;
  late String _trackingCodeStep;
  late List<dynamic> _deliveryOptions;


  ShipmentProvider.fromJson(Map<String, dynamic> map){
    name = map["Name"];
    api = map["Default"];
    defaultStatus = map["ApiIntegration"];
    cod = map["Cod"];
    trackingRegex = map["TrackingCodeValidationRegex"];
    trackingExample = map["TrackingCodeExample"];
    trackingUrl = map["TrackingUrl"];
    trackingCodeStep = map["TrackingCodeSetOnStep"];
    if (map["EnabledDeliveryOptions"] != "")
    deliveryOptions = parseDeliveryOption( map["EnabledDeliveryOptions"]);
  }


  //getters
  String get name => this._name;
  String get defaultStatus => this._default;
  String get apiIntegration => this._api;
  String get cod => this._cod;
  String get trackingCodeValidationRegex => this._trackingRegex;
  String get trackingCodeExample => this._trackingExample;
  String get trackingUrl => this._trackingUrl;
  String get trackingCodeSetOnStep => this._trackingCodeStep;
  List<dynamic> get deliveryOptions => this._deliveryOptions;

  set name(String value) {
    _name = value;
  }

  set deliveryOptions(List<dynamic> value) {
    _deliveryOptions = value;
  }

  set trackingCodeStep(String value) {
    _trackingCodeStep = value;
  }

  set trackingUrl(String value) {
    _trackingUrl = value;
  }

  set trackingExample(String value) {
    _trackingExample = value;
  }

  set trackingRegex(String value) {
    _trackingRegex = value;
  }

  set cod(String value) {
    _cod = value;
  }

  set defaultStatus(String value) {
    _default = value;
  }

  set api(String value) {
    _api = value;
  }
}



enum DeliveryOption{
  express,
  standard,
  economy
}