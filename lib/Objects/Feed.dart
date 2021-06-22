


class Feed{
  late String id; //todo uuid in jumia documentation
  late String status;
  late String action;
  late DateTime creationDate;
  late DateTime updatedDate;
  late String source;
  late int totalRecords;
  late int processedRecords;
  late int failedRecords;
  late List<Map<String, dynamic>> failureReports;

  Feed.fromJson(Map<String, dynamic> map){
    id = map["Feed"].toString();
    status = map["Status"];
    action = map["Action"];
    creationDate  = DateTime.parse(map["CreationDate"]);
    updatedDate = DateTime.parse(map["UpdatedDate"]);
    source = map["Source"];
    totalRecords = int.parse(map["TotalRecords"]);
    processedRecords = int.parse(map["ProcessedRecords"]);
    failedRecords = int.parse(map["FailedRecords"]);
    failureReports = map["FailureReports"];
  }

}