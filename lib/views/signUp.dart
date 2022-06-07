import 'package:flutter/material.dart';
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
                          "or use your email account",
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
                                  hintText: "Email",
                                  icon: Icons.email,
                                  controller: _emailTextController,
                                ),
                              ),
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
                                  hintText: "Name",
                                  icon: Icons.person,
                                  controller: _nameTextController,
                                ),
                              ),
                               Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: RoundedPasswordField(
                                    controller: _passwordTextController,
                                  )),
                              
                              RoundedButton(text: 'REGISTER', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const LoginScreen())
                                  );
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
}