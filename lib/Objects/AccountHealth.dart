

import 'package:jumia_gh_api/Objects/Metric.dart';

class AccountHealth{
  late HealthPercentage dayHealth;
  late HealthPercentage weekHealth;
  late HealthPercentage monthHealth;
  late HealthPercentage allTimeHealth;


  AccountHealth.fromJson(Map<String, dynamic> map){
    dayHealth = HealthPercentage.fromJson(map["Day"]);
    weekHealth = HealthPercentage.fromJson(map["Week"]);
    monthHealth = HealthPercentage.fromJson(map["Month"]);
    allTimeHealth = HealthPercentage.fromJson(map["Alltime"]);

  }

}


class HealthPercentage{
  late Percentage twoDayPercentage;
  late Percentage returnPercentage;
  late Percentage cancellationPercentage;


  HealthPercentage.fromJson(Map<String, dynamic> map){
    twoDayPercentage = Percentage(
        double.parse(map["TwoDaysShippedPercentage"]["Percentage"]),
        map["TwoDaysShippedPercentage"]["Text"]
    );
    returnPercentage = Percentage(
        double.parse(map["ReturnPercentage"]["Percentage"]),
        map["ReturnPercentage"]["Text"]
    );
    cancellationPercentage = Percentage(
        double.parse(map["CancellationPercentage"]["Percentage"]),
        map["CancellationPercentage"]["Text"]
    );
  }

}



class Percentage {
  late String text;
  late double value;

  Percentage(this.value, this.text);
}


