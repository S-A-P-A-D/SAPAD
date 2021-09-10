import 'dart:html';
import 'dart:js';

import 'package:intl/intl.dart';
import 'package:sapad_v3/FireBase/register_firebase.dart';
import 'package:sapad_v3/Telas/components/calendar_widget.dart';
import 'package:sapad_v3/Telas/components/event_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _calendarController = CalendarController();
  late List<String> emotea = [];
  late final String emoteName;
  List colors = [
    Colors.cyan[700],
    Colors.red[600],
    Colors.purpleAccent[700],
    Colors.deepOrange,
    Colors.green[700],
    Color(0xffEF9A9A),
    Color(0xFFF06292),
    Color(0xff3366cc)
  ];
  Random random = new Random();

  int index = 3;

  void changeIndex() {
    if (colors[3] != random.nextInt(8)) {
      setState(() => index = random.nextInt(8));
    }
  }

  late String auxiliar;

  late int contEmotemed = 0;
  late int contEmoteansi = 0;
  late int contEmotestress = 0;
  late int contEmoteraiva = 0;
  late int contEmotetriste = 0;
  int? _contEmotemed = 0;
  int? _contEmoteansi = 0;
  int? _contEmotestress = 0;
  int? _contEmoteraiva = 0;
  int? _contEmotetriste = 0;

  @override
  void initState() {
    _calendarController.selectedDate = DateTime.now();
    /* readFirebase(); */
    changeIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CalendarWidget(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.blue,
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage()))),
      );
}


/* 
  List<CalendarEmote> getDataSource() {
    List<CalendarEmote> calendarEmote = <CalendarEmote>[];
    calendarEmote.add(new CalendarEmote('teste')); */
    /* this.emotea.forEach((emoteName) => {
          if (emoteName == 'medo')
            {
              calendarEmote.add(new CalendarEmote('medo')),
              contEmotemed++,
            }
          else if (emoteName == 'stress')
            {
              calendarEmote.add(new CalendarEmote('stress')),
              contEmotestress++,
            }
          else if (emoteName == 'raiva')
            {
              calendarEmote.add(new CalendarEmote('raiva')),
              contEmoteraiva++,
            }
          else if (emoteName == 'ansiedade')
            {
              calendarEmote.add(new CalendarEmote('ansiedade')),
              contEmoteansi++,
            }
          else if (emoteName == 'triste')
            {
              calendarEmote.add(new CalendarEmote('triste')),
              contEmotetriste++,
            },
        }); */
    /* return calendarEmote;
  }

  readFirebase() async {
    var emote = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
    var auxiliar = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Times')
        .get();
    debugPrint(auxiliar.toString());
    List<String> emotea = []; */

    /* zeraCont() async {
      final DateTime now = new DateTime.now();
      final DateTime date = new DateTime(now.year, now.month, now.day);
      print('$date CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC');
     // new DateFormat("yyyy-MM-dd").parse(auxiliar);
      DateTime aux = date; //auxiliar
      if (date.isAfter(aux)) {
        contEmoteansi = 0;
        contEmotemed = 0;
        contEmotestress = 0;
        contEmoteraiva = 0;
        contEmotetriste = 0;
        print(aux);
        aux = date;
        updateFirebase('Times', 'auxiliar', aux);
        print('$aux BBBBBBBBBBBAAAAAAAAAAAAAAAAAAA');
      }
    }

    zeraCont(); */
    /* if (contEmotemed == 0) {
      if (emote['med'] == true) {
        emotea.add('medo');
        contEmotemed++;
      }
    }
    if (contEmoteansi == 0) {
      if (emote['ansi'] == true) {
        emotea.add('ansiedade');
      }
    }
    if (contEmoteraiva == 0) {
      if (emote['raiva'] == true) {
        emotea.add('raiva');
      }
    }
    if (contEmotestress == 0) {
      if (emote['stress'] == true) {
        emotea.add('stress');
      }
    }
    if (contEmotetriste == 0) {
      if (emote['triste'] == true) {
        emotea.add('triste');
      }
    }
    this.emotea = emotea;
    //setState(() {});
  }
}
 */
/* class DataCalendar {
  final dynamic aux;
  final dynamic date;

  DataCalendar(this.aux, this.date);
  Map<String, dynamic> toJson() {
    return {"date": this.date, "aux": this.aux};
  }

  DataCalendar.fromJson(Map json)
      : aux = json['aux'],
        date = json['date'];
} */

/* class CalendarEmoteSource extends CalendarDataSource {
  CalendarEmoteSource(List<CalendarEmote> source) {
    appointments = source;
  }
  @override
  String getSubject(int index) {
    return appointments![index].emoteName;
  }
}

class CalendarEmote {
  CalendarEmote(this.emoteName);
  String emoteName;
} */

/* _saveData() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setInt('_contEmotemed', _contEmotemed!);
  _prefs.setInt('_contEmoteansi', _contEmoteansi!);
  _prefs.setInt('_contEmoteraiva', _contEmoteraiva!);
  _prefs.setInt('_contEmotestress', _contEmotestress!);
  _prefs.setInt('_contEmotetriste', _contEmotetriste!);
}

_readData() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  setState(() {
    _contEmotemed = _prefs.getInt('_contEmotemed');
  });
}
 */