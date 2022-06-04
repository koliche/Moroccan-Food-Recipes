import 'package:flutter/material.dart';
import 'package:recipes_app/views/home.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';
import 'package:recipes_app/views/splashScreen.dart';

int? initScreen;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        'RootPage': (context) => MyBottomNavBar(),
        'Onboarding': (context) => const OnboardingScreen(),
      },
      initialRoute:
          initScreen == 0 || initScreen == null ? "Onboarding" : "RootPage",
      debugShowCheckedModeBanner: false,
    );
  }
}
