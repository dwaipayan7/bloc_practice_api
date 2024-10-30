import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_practice_api/feature/posts/models/post_data_ui_model.dart';
import 'package:bloc_practice_api/feature/posts/repository/posts_repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {

    on<PostInitialFetchEvent>(postInitialFetchEvent);
    
  }

  Future<void> postInitialFetchEvent(
      PostInitialFetchEvent event,
      Emitter<PostsState> emit) async{

    emit(PostFetchingLoadingState());
    try{

      List<PostDataUiModel> posts = await PostsRepo.fetchPost();
      emit(PostFetchingSuccessfulState(posts));
      print(posts);

    }catch(e){
      emit(PostFetchingErrorState(e.toString()));
        // print(e.toString());
    }

  }

}
