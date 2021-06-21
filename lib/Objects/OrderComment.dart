




import 'package:jumia_gh_api/utils/resources.dart';

class OrderComment{
  late int _id;
  late String _userName;
  late String _comments;
  late String _isOpened;
  late String _isAnswered;
  late CommentType _type;
  late DateTime _created;
  late DateTime _updated;
  List<OrderComment> _replies = [];

  OrderComment.fromJson(Map<String, dynamic> map){
    this.id = map["CommentId"];
    userName = map["Username"];
    content = map["Content"];
    isOpened = map["IsOpened"];
    isAnswered  = map["IsAnswered"];
    type = parseCommentType(map["Type"]);
    dateCreated = map["CreatedAt"];
    dateUpdated = map["UpdatedAt"];
    // comments = map[""]; //todo iterate through sub comments to get the replies to the comment
  }




  //Getters
  int get id => this._id;
  String get userName => this._userName;
  String get content => this._comments;
  String get isOpened => this._isOpened;
  String get isAnswered => this._isAnswered;
  CommentType get type => this._type;
  DateTime get dateCreated => this._created;
  DateTime get dateUpdated => this._updated;
  List<OrderComment> get comments => this._replies;


  //setters
  set id(int id) => this._id = id;
  set userName(String name) => this._userName = name;
  set content(String comment) => this._comments = comment;
  set isOpened(String open) => this._isOpened = open;
  set isAnswered(String answer) => this._isAnswered = answer;
  set comments(List<OrderComment> com) => this._replies = com;
  set type(CommentType type) => this._type = type;
  set addComment(OrderComment comment) => this._replies.add(comment);
  set dateCreated(DateTime date) => this._created = date;
  set dateUpdated(DateTime date) => this._updated = date;




}


enum CommentType{
  refund,
  action_required,
  information_only
}