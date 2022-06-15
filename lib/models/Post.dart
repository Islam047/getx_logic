import 'dart:convert';
Post postFromJson(String str) => Post.fromJson(json.decode(str));
String postToJson(Post data) => json.encode(data.toJson());
class Post {
  Post({
    required  this.userId,
    required  this.id,
    required  this.title,
    required this.body,});

  Post.fromJson(Map<String,dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
 late int userId;
 late int id;
 late String title;
 late String body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}