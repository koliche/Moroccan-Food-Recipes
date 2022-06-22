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
