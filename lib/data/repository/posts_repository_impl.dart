import 'package:dartz/dartz.dart';
import 'package:flutter_pagination/domain/datasource/posts_datasource.dart';

import '../../domain/repository/posts_repository.dart';
import '../../locator.dart';

class PostsRepositoryImpl extends IPostsRepository {
  final IPostsDatasource _postsDatasource = locator.get();

  @override
  Future<Either<String, List<String>>> getPosts(int page,int limit) async {
    try {
      var posts = await _postsDatasource.getPosts(page,limit);
      return right(posts);
    } catch (ex) {
      return left('error get data');
    }
  }
}
