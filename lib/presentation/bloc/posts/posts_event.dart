part of 'posts_bloc.dart';

abstract class PostsEvent {}

class PostsRequestGetMorePostsEvent extends PostsEvent{}

class PostsAnimToStartListEvent extends PostsEvent{}
