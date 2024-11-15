import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:knovator_assignment/model/comments_model.dart';
import 'package:knovator_assignment/model/post_data_model.dart';

class ApiService {
  static Future<List<PostData>> getpost() async {
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      log("Getting post...");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<PostData> postData = [];
        if (jsonResponse is List) {
          for (var element in jsonResponse) {
            postData.add(PostData.fromJson(element));
          }
        }
        return postData;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      log("Error: ${e.toString()}");
      return [];
    }
  }

  static Future<List<CommentData>> getComments() async {
    try {
      final url = Uri.parse("https://jsonplaceholder.org/comments");
      log("Getting comments...");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<CommentData> commentData = [];
        if (jsonResponse is List) {
          for (var element in jsonResponse) {
            commentData.add(CommentData.fromJson(element));
          }
        }
        return commentData;
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      log("Error: ${e.toString()}");
      return [];
    }
  }
}
