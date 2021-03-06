// ignore_for_file: file_names, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:recipes_app/views/login.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';

import 'home.dart';

//import 'package:foodies/components/bottom_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 75, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Text View Whithe his Animation ::::::
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    'What  to cook\n today?',
                    style: const TextStyle(
                      fontFamily: 'Acherus',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ).copyWith(height: 1.1),
                  ),
                ),
                // Second Text View Whithe his Animation ::::::
                const SizedBox(height: 5),
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: const Text(
                    'Delicious and Detailed recipes from around the world\n on your phone',
                    style: TextStyle(
                      fontFamily: 'Acherus',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Image View Whithe his Animation ::::::
                const SizedBox(height: 40),
                FadeInUp(
                  delay: const Duration(milliseconds: 700),
                  child: Image.asset(
                    'assets/images/chef.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(height: 55),
                Center(
                  child: InkWell(
                    // To Navigate to the Root page ::::::
                    onTap: () {
                      AuthenticationRouting();
                    },
                    // Get Started Button Whithe his Animation ::::::
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: deviceSize.height * 0.07,
                        width: deviceSize.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            deviceSize.width / 2,
                          ),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: const TextStyle(
                              fontFamily: 'Acherus',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ).apply(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void AuthenticationRouting() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/loginPage', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/rootPage', (route) => false);
    }
  }
}
