import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sapad_v3/FireBase/register_firebase.dart';
import 'package:sapad_v3/Telas/HomeScreens/stats.dart';

listHelperOver(String terapia) async {
  var tec = await FirebaseFirestore.instance
      .collection(user.email.toString())
      .doc('EmotionStats')
      .get();

  List<dynamic> listMedit = (tec.data()?[terapia]);
  var listMedit2 = listMedit.map((e) => EmotionStats.fromJson(e)).toList();
  var listMeditOver = listMedit2.groupBy((m) => m.emotion);

  return listMeditOver;
}

listHelper2(String terapia) async {
  var tec = await FirebaseFirestore.instance
      .collection(user.email.toString())
      .doc('EmotionStats')
      .get();

  List<dynamic> listMedit = (tec.data()?[terapia]);
  var listMedit2 = listMedit.map((e) => EmotionStats.fromJson(e)).toList();
  // ignore: unused_local_variable
  var listMeditOver = listMedit2.groupBy((m) => m.emotion);

  return listMedit2;
}
