import 'package:dio/dio.dart';
import 'package:flutter_pagination/data/datasource/posts_datasource_impl.dart';
import 'package:flutter_pagination/data/repository/posts_repository_impl.dart';
import 'package:flutter_pagination/presentation/bloc/main/main_cubit.dart';
import 'package:flutter_pagination/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_pagination/utils/constants/constants.dart';
import 'package:get_it/get_it.dart';

import 'config/router/app_router.dart';
import 'domain/datasource/posts_datasource.dart';
import 'domain/repository/posts_repository.dart';

var locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<AppRouter>(AppRouter());
  Dio _dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  locator.registerSingleton<Dio>(_dio);

  /// datasource
  locator.registerSingleton<IPostsDatasource>(PostsDatasourceImpl());

  /// repository
  locator.registerSingleton<IPostsRepository>(PostsRepositoryImpl());

  /// bloc
  locator.registerFactory<PostsBloc>(()=>PostsBloc());
  locator.registerSingleton<MainCubit>(MainCubit());
}
