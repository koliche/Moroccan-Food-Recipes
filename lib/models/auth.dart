import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> getCurrentUser() async {
    // ignore: await_only_futures
    return await auth.currentUser;
  }

  Future<void> createUser(String email, String password, String profileImage,
      String fullName) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    Map<String, dynamic> userInfoMap = {
      "email": email,
      "password": password,
      "fullName": fullName,
      "profileImage": profileImage
    };
    if (userCredential != null) {
      DatabaseMathods().addUserInfoDB(auth.currentUser!.uid, userInfoMap);
    }
  }

  Future<void> loginWithEmailAndPass(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}

//classe fore get and put user in firestore db
class DatabaseMathods {
  Future addUserInfoDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<DocumentSnapshot> getUserFromDB(String userId) async {
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }
}
