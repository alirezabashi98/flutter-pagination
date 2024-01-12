import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/presentation/bloc/posts/posts_bloc.dart';

import '../../locator.dart';

@RoutePage()
class SchoolScreen extends StatelessWidget implements AutoRouteWrapper {
  const SchoolScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: locator.get<PostsBloc>()..add(PostsRequestGetMorePostsEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsInitState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostsErrorRequestState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is PostsResponseState) {
            return ListView.builder(
              controller: context.read<PostsBloc>().scrollController,
              itemCount: context.read<PostsBloc>().posts.length + 1,
              itemBuilder: (context, index) {
                if (context.read<PostsBloc>().posts.length > index) {
                  return ListTile(
                    title: Text(context.read<PostsBloc>().posts[index]),
                  );
                } else {
                  if (state.hasMore) {
                    context
                        .read<PostsBloc>()
                        .add(PostsRequestGetMorePostsEvent());
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: state.hasMore
                        ? const Center(child: CircularProgressIndicator())
                        : const Center(child: Text('No more data to load')),
                  );
                }
              },
            );
          }
          return const Center(
            child: Text(':('),
          );
        },
      ),
    );
  }
}
