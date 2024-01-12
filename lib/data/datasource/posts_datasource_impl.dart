import 'package:dio/dio.dart';
import 'package:flutter_pagination/domain/datasource/posts_datasource.dart';

import '../../locator.dart';

class PostsDatasourceImpl extends IPostsDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<String>> getPosts(int page,int limit) async {
    try {
      var response = await _dio.get('posts',queryParameters: {'_limit':limit,'_page':page});
      return response.data.map<String>((json) => 'Item ${json['id']}').toList();
    } catch (ex) {
      rethrow;
    }
  }
}
