import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection('loker');

  static Future<DocumentSnapshot> getLoker(String id) async {
    return await productCollection.doc("image_" + id).get();
  }
}
