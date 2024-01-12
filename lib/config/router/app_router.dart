import 'package:auto_route/auto_route.dart';

import '../../presentation/views/main_screen.dart';
import '../../presentation/views/post_screen.dart';
import '../../presentation/views/business_screen.dart';
import '../../presentation/views/school_screen.dart';

part 'app_router.gr.dart';

//! Use the [watch] flag to watch the files' system for edits and rebuild as necessary.
/// flutter packages pub run build_runner watch
//! if you want the generator to run one time and exit, use
/// flutter packages pub run build_runner build

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          path: '/main',
        ),
        AutoRoute(page: PostRoute.page),
        AutoRoute(page: BusinessRoute.page),
        AutoRoute(page: SchoolRoute.page),
      ];
}
