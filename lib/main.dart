import 'package:flutter/material.dart';
import 'package:flutter_pagination/locator.dart';
import 'package:flutter_pagination/presentation/views/main_screen.dart';

import 'config/router/app_router.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: locator.get<AppRouter>().config(),
    );
  }
}
