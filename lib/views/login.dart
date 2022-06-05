import 'package:flutter/material.dart';
import 'package:recipes_app/views/widgets/LoginWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: 200,
            height: 200,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Upside(
                    imgUri: "assets/images/login.png",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
