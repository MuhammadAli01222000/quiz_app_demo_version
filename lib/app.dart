import 'package:flutter/material.dart';
import 'package:git_and_gitlab/quiz_app/core/config/routes.dart';
import 'package:git_and_gitlab/quiz_app/pages/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),
    routes:AppRoutes.routes,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
