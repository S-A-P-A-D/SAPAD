import 'package:sapad_v3/FireBase/register_firebase.dart';
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

  late int contEmotemed = 0;
  late int contEmoteansi = 0;
  late int contEmotestress = 0;
  late int contEmoteraiva = 0;
  late int contEmotetriste = 0;

  @override
  void initState() {
    readFirebase();
    changeIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SfCalendar(
        view: CalendarView.month,
        timeZone: 'E. South America Standard Time',
        todayHighlightColor: colors[index],
        cellBorderColor: colors[index],
        showNavigationArrow: true,
        cellEndPadding: 3,
        backgroundColor: Colors.black87,
        dataSource: CalendarEmoteSource(_getDataSource()),
        headerStyle: CalendarHeaderStyle(
            backgroundColor: colors[index],
            textAlign: TextAlign.center,
            textStyle: TextStyle(
                fontSize: 18,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w500,
                letterSpacing: 3,
                color: Colors.white)),
        viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: TextStyle(fontSize: 18, color: colors[index])),
        monthViewSettings: MonthViewSettings(
            numberOfWeeksInView: 6,
            appointmentDisplayCount: 1,
            showAgenda: true,
            agendaItemHeight: 40,
            agendaStyle: AgendaStyle(
              backgroundColor: Colors.black12,
              appointmentTextStyle:
                  TextStyle(fontSize: 14, color: Colors.white),
            ),
            dayFormat: 'EEE',
            monthCellStyle: MonthCellStyle(
                textStyle: TextStyle(
                    fontSize: 12, fontFamily: 'Arial', color: Colors.white),
                leadingDatesTextStyle:
                    TextStyle(fontSize: 12, color: Colors.grey[800])),
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    ));
  }

  List<CalendarEmote> _getDataSource() {
    final List<CalendarEmote> calendarEmote = <CalendarEmote>[];
    this.emotea.forEach((emoteName) => {
          if (emoteName == 'medo')
            {
              calendarEmote.add(new CalendarEmote('medo')),
            }
          else if (emoteName == 'stress')
            {
              calendarEmote.add(new CalendarEmote('stress')),
            }
          else if (emoteName == 'raiva')
            {
              calendarEmote.add(new CalendarEmote('raiva')),
            }
          else if (emoteName == 'ansiedade')
            {
              calendarEmote.add(new CalendarEmote('ansiedade')),
            }
          else if (emoteName == 'triste')
            {
              calendarEmote.add(new CalendarEmote('triste')),
            }
        });
    return calendarEmote;
  }

  zeraCont() {
    DateTime zera = DateTime.now();
    dynamic aux;
    if (zera.toUtc().isAfter(aux)) {
      contEmoteansi = 0;
      contEmotemed = 0;
      contEmotestress = 0;
      contEmoteraiva = 0;
      contEmotetriste = 0;
      aux = zera;
    }
  }

  readFirebase() async {
    var emote = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
    List<String> emotea = [];
    zeraCont();
    if (contEmotemed == 0) {
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
    setState(() {});
  }
}

class CalendarEmoteSource extends CalendarDataSource {
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
}
