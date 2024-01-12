import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/repository/posts_repository.dart';
import '../../../locator.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final IPostsRepository _postsRepository = locator.get();
  final List<String> posts = [];
  int page = 1;
  bool hasMore = true;
  int limit = 15;
  var scrollController = ScrollController();


  PostsBloc() : super(PostsInitState()) {

    /// get posts for page
    on<PostsRequestGetMorePostsEvent>((event, emit) async {
      var response = await _postsRepository.getPosts(page++,limit);
      response.fold((errorMessage) {
        if (kDebugMode) {
          print(errorMessage);
        }
        emit(PostsErrorRequestState(errorMessage));
      }, (newPosts) {
        hasMore = newPosts.length >= limit;
        posts.addAll(newPosts);
        emit(PostsResponseState(posts,hasMore));
      });
    });

    on<PostsAnimToStartListEvent>((event, emit) {
      scrollController.animateTo(0, duration: const Duration(milliseconds: 600), curve: Curves.linear);
    },);

  }
}
