import 'package:dartz/dartz.dart';

abstract class IPostsRepository {
  Future<Either<String, List<String>>> getPosts(int page,int limit);
}
