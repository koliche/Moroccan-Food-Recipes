import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'home.dart';

//import 'package:foodies/components/bottom_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

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
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    'What  to cook\n today?',
                    style: TextStyle(
                      fontFamily: 'Acherus',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ).copyWith(height: 1.1),
                  ),
                ),
                const SizedBox(height: 5),
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    'Delicious and Detailed recipes from around the world\n on your phone',
                    style: TextStyle(
                      fontFamily: 'Acherus',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: deviceSize.height * 0.07,
                        width: deviceSize.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            deviceSize.width / 2,
                          ),
                          color: Colors.greenAccent,
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
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
}
