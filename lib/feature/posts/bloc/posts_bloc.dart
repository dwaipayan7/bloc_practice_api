import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_api/feature/posts/models/post_data_ui_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
   
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    
  }

  Future<void> postInitialFetchEvent(
      PostInitialFetchEvent event,
      Emitter<PostsState> emit) async{

    var client = http.Client();
    List<PostDataUiModel> posts = [];

    try{

      var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for(int i=0; i<result.length; i++){
        PostDataUiModel post = PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);  // ---> added the data into the posts[] array
      }

      print(posts);
      emit(PostFetchingSuccessfulState(posts));


    }catch(e){
        print(e.toString());
    }

  }


}
