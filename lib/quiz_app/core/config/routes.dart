import 'package:flutter/material.dart';
import 'package:git_and_gitlab/quiz_app/pages/first_page.dart';
import 'package:git_and_gitlab/quiz_app/pages/second_page.dart';
import 'package:git_and_gitlab/quiz_app/pages/third_page.dart';

class AppRoutes {
  static const String home = "home";
  static const String second = "second";
  static const String third = "third";

  /// app routes
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case second:
        final int level = settings.arguments as int? ?? 1;
        return MaterialPageRoute(
          builder: (context) => SecondPage(level: level, result: 1,),
        );

      case third:
        if (settings.arguments is List<int>) {
          final args = settings.arguments as List<int>;
          return MaterialPageRoute(
            builder: (context) => ThirdPage(list: args),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text("Xato")),
        body: const Center(child: Text("Noto‘g‘ri yo‘l!")),
      ),
    );
  }
}
