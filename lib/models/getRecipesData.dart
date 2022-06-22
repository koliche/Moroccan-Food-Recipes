// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';

List<dynamic> docIds = [];
Future getDocId() async {
  await FirebaseFirestore.instance
      .collection("recipes")
      .get()
      .then((snapshot) => snapshot.docs.forEach((document) {
            docIds.add(document.reference.id);
          }));
}

List<dynamic> detailIds = [];
Future getDetailId() async {
  await FirebaseFirestore.instance
      .collection("recipes")
      .doc()
      .collection("Detail")
      .get()
      .then((snapshot) => snapshot.docs.forEach((document) {
            detailIds.add(document.reference.id);
          }));
}
