import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:recipes_app/views/widgets/LoginWidget.dart';
import 'package:recipes_app/views/widgets/pageTiteleBar.dart';
import 'package:recipes_app/views/widgets/roundedButton.dart';
import 'package:recipes_app/views/widgets/roundedInputField.dart';
import 'package:recipes_app/views/widgets/roundedPasswordField.dart';

import 'login.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmePasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Upside(),
                const PageTitleBar(title: 'Create New Account'),
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
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: RoundedInputField(
                                  hintText: "Name",
                                  icon: Icons.person,
                                  controller: _nameTextController,
                                ),
                              ),
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
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: RoundedPasswordField(
                                    hintText: "Confirm Password",
                                    controller: _confirmePasswordTextController,
                                  )),
                              RoundedButton(
                                  text: 'REGISTER',
                                  press: () {
                                    // the register methode ::::::::::::::
                                    signup();
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.pushNamed(context, '/loginPage');
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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

  void signup() async {
    var fullName = _nameTextController.text.trim();
    var email = _emailTextController.text.trim();
    var password = _passwordTextController.text.trim();
    var confirmPass = _confirmePasswordTextController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPass.isEmpty) {
      // show error toast

      Fluttertoast.showToast(msg: 'Please fill all fields');
      return;
    }

    if (password.length < 6) {
      // show error toast
      Fluttertoast.showToast(
          msg: 'Weak Password, at least 6 characters are required');

      return;
    }

    if (password != confirmPass) {
      // show error toast
      Fluttertoast.showToast(msg: 'Passwords do not match');

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

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        // store user information in Realtime database
        String uid = userCredential.user!.uid;
        int dt = DateTime.now().millisecondsSinceEpoch;

        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'fullName': fullName,
          'email': email,
          'uid': uid,
          'dt': dt,
          'profileImage':
              'https://firebasestorage.googleapis.com/v0/b/recipes-app-78f79.appspot.com/o/profiel.png?alt=media&token=0ff8dee4-c1b8-4fe8-963e-a0dd97f42949'
        });

        Fluttertoast.showToast(msg: 'Success');

        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(msg: 'Failed');
      }

      progressDialog.hide();
    } on FirebaseAuthException catch (e) {
      progressDialog.hide();
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Email is already in Use');
      } else if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Password is weak');
      }
    } catch (e) {
      progressDialog.hide();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
