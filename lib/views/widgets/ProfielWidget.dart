import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:recipes_app/models/userModel.dart';

class ProfielWidget extends StatefulWidget {
  const ProfielWidget({Key? key}) : super(key: key);

  @override
  _ProfielWidgetState createState() => _ProfielWidgetState();
}

class _ProfielWidgetState extends State<ProfielWidget> {
  User? user;
  UserModel? userModel = UserModel(
      uid: "jjhuu",
      fullName: "fullName",
      email: "email",
      profileImage: "",
      dt: 23);
  DatabaseReference? userRef;

  File? imageFile;
  bool showLocalFile = false;

  _getUserDetails() async {
    DataSnapshot snapshot = (await userRef!.once()) as DataSnapshot;

    userModel = UserModel.fromMap(snapshot.value as Map<String, dynamic>);

    setState(() {});
  }

  _pickImageFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});

    // upload to firebase storage

    ProgressDialog progressDialog = ProgressDialog(
      context,
    );
    progressDialog.style(message: ' Please wait \n Uploading !!!');
    progressDialog.show();
    try {
      var fileName = userModel!.email + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;
      final usere = FirebaseAuth.instance.currentUser;
      DatabaseReference userRef =
          // ignore: deprecated_member_use
          FirebaseDatabase.instance.reference().child('users');
      String uid = usere!.uid;

      String profileImageUrl = await snapshot.ref.getDownloadURL();
      await userRef.child(uid).update({'profileImage': profileImageUrl});
      print(profileImageUrl);

      progressDialog.hide();
    } catch (e) {
      progressDialog.hide();

      print(e.toString());
    }
  }

  _pickImageFromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userRef =
          FirebaseDatabase.instance.reference().child('users').child(user!.uid);
    }

    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userModel == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 80,
                            backgroundImage: showLocalFile
                                ? FileImage(imageFile!) as ImageProvider
                                : userModel!.profileImage == ''
                                    ? const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                    : NetworkImage(userModel!.profileImage)),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.image),
                                          title: const Text('From Gallery'),
                                          onTap: () {
                                            _pickImageFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text('From Camera'),
                                          onTap: () {
                                            _pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                userModel!.fullName,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                userModel!.email,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Joined ${getHumanReadableDate(userModel!.dt)}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}
