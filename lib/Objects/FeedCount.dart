


class FeedCount{
  late int total;
  late int queued;
  late int processing;
  late int finished;
  late int canceled;


  FeedCount.fromJson(Map<String,dynamic> map){
  total = int.parse(map["Total"]);
  queued = int.parse(map["Queued"]);
  processing = int.parse(map["Processing"]);
  finished = int.parse(map["Finished"]);
  canceled = int.parse(map["Canceled"]);
  }


}