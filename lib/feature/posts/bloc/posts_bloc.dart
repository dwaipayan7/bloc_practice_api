import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
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

    try{

      var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));


    print(response.body);
    }catch(e){
        print(e.toString());
    }

  }


}
