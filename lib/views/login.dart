import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/authentification.dart';
import 'package:recipes_app/views/home.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';
import 'package:recipes_app/views/signUp.dart';
import 'package:recipes_app/views/widgets/LoginWidget.dart';
import 'package:recipes_app/views/widgets/pageTiteleBar.dart';
import 'package:recipes_app/views/widgets/roundedButton.dart';
import 'package:recipes_app/views/widgets/roundedInputField.dart';
import 'package:recipes_app/views/widgets/roundedPasswordField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // Up side Logo and disgne :::::::
                Upside(),
                const PageTitleBar(title: "Login to your account"),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          child: Column(
                            children: [
                              // Email and Password Fialde :::::::
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: RoundedInputField(
                                  hintText: "Email",
                                  icon: Icons.email,
                                  controller: _emailTextController,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: RoundedPasswordField(
                                    hintText: "Password",
                                    controller: _passwordTextController,
                                  )),

                              switchListTile(),
                              // Log in Button ::::::::::::::::::
                              RoundedButton(
                                  text: 'LOGIN',
                                  press: () {
                                    // the login methode :::::::::::::::::::::::::::::
                                    login();
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.pushNamed(context, '/SignupPage');
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                height: 60,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (_passwordTextController.text.isEmpty ||
        _emailTextController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "You sould add all fielde",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/rootPage', (route) => false);
        ;
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: false,
      activeColor: Colors.black,
      onChanged: (val) {},
    ),
  );
}
