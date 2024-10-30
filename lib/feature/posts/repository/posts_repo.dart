
import 'dart:convert';
import 'package:bloc_practice_api/feature/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo{


  static Future<List<PostDataUiModel>>fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];

    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post = PostDataUiModel.fromMap(
            result[i] as Map<String, dynamic>);
        posts.add(post); // ---> added the data into the posts[] array
      }

      return posts;
      // emit(PostFetchingSuccessfulState(posts));


    } catch (e) {
      print(e.toString());
      return [];
    }
  }


  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {
          "title": "Dwaipayan",
          "body": "I'm a flutter developer",
          "userId": "34", // Convert userId to string
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        print("Failed with status code: ${response.statusCode}");
        return false;
      }

    } catch (e) {
      print(e.toString());
      return false;
    } finally {
      client.close();
    }
  }

}