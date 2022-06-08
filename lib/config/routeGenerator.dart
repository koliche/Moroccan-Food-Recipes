import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/views/login.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';
import 'package:recipes_app/views/signUp.dart';
import 'package:recipes_app/views/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/rootPage':
        return MaterialPageRoute(
          builder: (_) => MyBottomNavBar(),
        );
      case '/loginPage':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case '/SignupPage':
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      // return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
