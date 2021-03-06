import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
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
    var email = _emailTextController.text.trim();
    var password = _passwordTextController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      // show error toast
      Fluttertoast.showToast(msg: 'Please fill all fields');
      return;
    }

    // request to firebase auth

    ProgressDialog progressDialog = ProgressDialog(
      context,
    );

    progressDialog.style(message: "Sign up succesfully");

    progressDialog.show();

    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        progressDialog.hide();
        Navigator.pushNamedAndRemoveUntil(
            context, '/rootPage', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      progressDialog.hide();

      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User not found');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
      progressDialog.hide();
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
        value: true,
        activeColor: Colors.black,
        onChanged: (val) {},
      ),
    );
  }
}
