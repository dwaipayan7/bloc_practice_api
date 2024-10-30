part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

abstract class PostActionState extends PostsState{}

final class PostsInitial extends PostsState {}


class PostFetchingSuccessfulState extends PostsState{
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfulState(this.posts);
}

class PostFetchingLoadingState extends PostsState{}

class PostFetchingErrorState extends PostsState{
  final String errorMessage;

  PostFetchingErrorState(this.errorMessage);
}

class PostsAdditionSuccessState extends PostActionState{}

class PostsAdditionErrorState extends PostActionState{}
