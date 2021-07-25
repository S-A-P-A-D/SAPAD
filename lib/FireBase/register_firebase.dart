import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
