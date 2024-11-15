import 'dart:convert';

CommentData commentDataFromJson(String str) =>
    CommentData.fromJson(json.decode(str));

String commentDataToJson(CommentData data) =>
    json.encode(data.toJson());

class CommentData {
  int? id;
  int? postId;
  int? userId;
  String? comment;

  CommentData({
    this.id,
    this.postId,
    this.userId,
    this.comment,
  });

  CommentData copyWith({
    int? id,
    int? postId,
    int? userId,
    String? comment,
  }) =>
      CommentData(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
      );

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        id: json["id"],
        postId: json["postId"],
        userId: json["userId"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postId": postId,
        "userId": userId,
        "comment": comment,
      };
}
