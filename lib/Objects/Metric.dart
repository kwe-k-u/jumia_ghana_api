class Metric {
  late MetricType _type;
  late int _skuNumber;
  late int _skuActive;
  late double _total;
  late int _orderCount;
  late double _commission;
  late double _shipmentPercentage;
  late double _returnsPercentage;
  late double _cancellationPercentage;

  //getters
  MetricType get type => this._type;
  int get skuNumber => this._skuNumber;
  int get skuActive => this._skuActive;
  double get salesTotal => this._total;
  int get orderCount => this._orderCount;
  double get commissions => this._commission;
  double get twoDayShipmentPercentage => this._shipmentPercentage;
  double get returnsPercentage => this._returnsPercentage;
  double get cancellationPercentage => this._cancellationPercentage;

  set type(dynamic value) {
    if (value.runtimeType == MetricType)
      _type = value;


    else{
      switch (value){
        case 'alltime':
          _type = MetricType.alltime;
          break;

        case 'month':
          _type = MetricType.month;
          break;

        case 'week':
          _type = MetricType.week;
          break;

        case 'day':
          _type = MetricType.day;
          break;
      }
    }
  }

  set skuActive(int value) {
    _skuActive = value;
  }

  set skuNumber(int value) {
    _skuNumber = value;
  }

  set total(double value) {
    _total = value;
  }

  set orderCount(int value) {
    _orderCount = value;
  }

  set commission(double value) {
    _commission = value;
  }

  set shipmentPercentage(double value) {
    _shipmentPercentage = value;
  }

  set returnsPercentage(double value) {
    _returnsPercentage = value;
  }

  set cancellationPercentage(double value) {
    _cancellationPercentage = value;
  }

  Metric.fromJson(Map<String, dynamic> map){
    this.type = map["StatisticsType"];
    this.skuNumber = int.parse(map["SkuNumber"]);
    this.skuActive = int.parse(map["SkuActive"]);
    this.total = double.parse(map["SalesTotal"]);
    this.orderCount = int.parse(map["Orders"]);
    this.commission = double.parse(map["Commissions"]);
    this.shipmentPercentage = double.parse(map["TwoDayShipmentPercentage"]);
    this.returnsPercentage = double.parse(map["ReturnsPercentage"]);
    this.cancellationPercentage = double.parse(map["CancellationsPercentage"]);
  }

//setters

}

enum MetricType { day, week, month, alltime }
