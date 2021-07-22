import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sapad_v3/Telas/HomeScreens/stats.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;

updateFirebase(String doc, String campo, var variavel) {
  db.collection(user.email.toString()).doc(doc).update({
    campo: variavel,
  });
}

updateFirebaseArray(String doc, String campo, dynamic values) {
  db.collection(user.email.toString()).doc(doc).update({
    campo: FieldValue.arrayUnion([values]),
  });
}

/* Future<void> appendToArray(String id, dynamic element) async {
  _firestore.collection(RootKey).doc(id).update({
    'myArrayField': FieldValue.arrayUnion([element]),
  });
}

Future<void> removeFromArray(String id, dynamic element) async {
  _firestore.collection(RootKey).doc(id).update({
    'myArrayField': FieldValue.arrayRemove([element]),
  });
}
 */