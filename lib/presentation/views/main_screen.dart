import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/presentation/bloc/main/main_cubit.dart';
import 'package:flutter_pagination/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_pagination/presentation/views/business_screen.dart';
import 'package:flutter_pagination/presentation/views/post_screen.dart';
import 'package:flutter_pagination/presentation/views/school_screen.dart';

import '../../locator.dart';
import '../bloc/main/main_state.dart';

@RoutePage()
class MainScreen extends StatefulWidget implements AutoRouteWrapper {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<MainCubit>(),
      child: this,
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  PostsBloc postsBloc = locator.get();
  PostsBloc businessBloc = locator.get();
  PostsBloc schoolBloc = locator.get();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) {
        var repetitious = (previous.index == current.index);
        if (repetitious) {
          switch (current.index) {
            case 0:
              postsBloc.add(PostsAnimToStartListEvent());
              break;
            case 1:
              businessBloc.add(PostsAnimToStartListEvent());
              break;
            case 2:
              schoolBloc.add(PostsAnimToStartListEvent());
              break;
          }
        }
        return !repetitious;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pagination Sample'),
          ),
          body: IndexedStack(
            index: state.index,
            children: [
              BlocProvider(
                create: (context) =>
                    postsBloc..add(PostsRequestGetMorePostsEvent()),
                child: const PostScreen(),
              ),
              BlocProvider(
                create: (context) =>
                    businessBloc..add(PostsRequestGetMorePostsEvent()),
                child: const BusinessScreen(),
              ),
              BlocProvider(
                create: (context) =>
                    schoolBloc..add(PostsRequestGetMorePostsEvent()),
                child: const SchoolScreen(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.local_post_office_outlined),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: state.index,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) {
              context.read<MainCubit>().getNavbarItem(index);
            },
          ),
        );
      },
    );
  }
}
