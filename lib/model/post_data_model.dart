import 'dart:convert';

PostData postDataFromJson(String str) => PostData.fromJson(json.decode(str));

String postDataToJson(PostData data) => json.encode(data.toJson());

class PostData {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostData({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  PostData copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      PostData(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
