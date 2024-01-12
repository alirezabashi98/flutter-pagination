part of 'posts_bloc.dart';

abstract class PostsState {}

class PostsInitState extends PostsState {}

class PostsResponseState extends PostsState {
  List<String> posts;
  bool hasMore;

  PostsResponseState(this.posts,this.hasMore);
}
class PostsErrorRequestState extends PostsState {
  String errorMessage;

  PostsErrorRequestState(this.errorMessage);
}
