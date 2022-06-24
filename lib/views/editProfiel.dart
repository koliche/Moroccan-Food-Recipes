import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/views/Profiel.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';

class EditProfil extends StatefulWidget {
  EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference userInfo =
        FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: userInfo.doc(FirebaseAuth.instance.currentUser!.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              appBar: AppBar(
                foregroundColor: kWhite,
                backgroundColor: kPrimaryColor,
                centerTitle: true,
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500, color: kWhite),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        data['profileImage'],
                                      ))),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 40),
                        child: TextField(
                          controller: _nameTextController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 3),
                              labelText: 'Full Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: data['fullName'],
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      // Email Text Failde :::::::::::::::::::::::::
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: TextFormField(
                          controller: _emailTextController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 3),
                              labelText: 'Email',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: data['email'],
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      // Submet Button ::::::::::::::::
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                updateInfo();
                              }, //This prop for beautiful expressions
                              child: const Text(
                                  "Submet"), // This child can be everything. I want to choose a beautiful Text Widget
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                minimumSize: const Size(100,
                                    50), //change size of this beautiful button
                                // We can change style of this beautiful elevated button thanks to style prop
                                primary:
                                    kPrimaryColor, // we can set primary color
                                onPrimary:
                                    Colors.white, // change color of child prop
                                onSurface: kPrimaryColor, // surface color
                                shadowColor: Colors
                                    .grey, //shadow prop is a very nice prop for every button or card widgets.
                                elevation:
                                    5, // we can set elevation of this beautiful button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30), //change border radius of this beautiful button thanks to BorderRadius.circular function
                                ),
                                tapTargetSize: MaterialTapTargetSize.padded,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: Container(
                height: 20,
                child:
                    CircularProgressIndicator(backgroundColor: Colors.white)),
          );
        });

    /*
  */
  }

  void updateInfo() async {
    var fullName = _nameTextController.text.trim();
    var email = _emailTextController.text.trim();
    // request to firebase auth
    ProgressDialog progressDialog = ProgressDialog(
      context,
    );

    progressDialog.style(message: "update succesfully");

    progressDialog.show();
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      if (fullName.isEmpty && !email.isEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'email': email,
        }).then((value) {
          Fluttertoast.showToast(msg: 'Success');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyBottomNavBar()));
        });
      } else if (!fullName.isEmpty && email.isEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'fullName': fullName,
        }).then((value) {
          Fluttertoast.showToast(msg: 'Success');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyBottomNavBar()));
        });
      } else if (fullName.isEmpty && email.isEmpty) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyBottomNavBar()));
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'fullName': fullName,
          'email': email,
        }).then((value) {
          Fluttertoast.showToast(msg: 'Success');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyBottomNavBar()));
        });
      }
      progressDialog.hide();
    } on FirebaseAuthException catch (e) {
      progressDialog.hide();
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Email is already in Use');
      }
    } catch (e) {
      progressDialog.hide();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
