import 'package:sapad_v3/FireBase/register_firebase.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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

  @override
  void initState() {
    changeIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SfCalendar(
        view: CalendarView.month,
        todayHighlightColor: colors[index],
        cellBorderColor: colors[index],
        showNavigationArrow: true,
        cellEndPadding: 3,
        backgroundColor: Colors.black87,
        dataSource: CalendarEmoteSource(_getDataSource()),
        headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            textStyle:
                TextStyle(fontSize: 18, letterSpacing: 3, color: Colors.white)),
        viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: TextStyle(fontSize: 18, color: colors[index])),
        monthViewSettings: MonthViewSettings(
            numberOfWeeksInView: 6,
            appointmentDisplayCount: 2,
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
                leadingDatesTextStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Arial',
                    color: Colors.grey[800])),
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    ));
  }

  readFirebase() async {
    var emote = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
  }
}

List<CalendarEmote> _getDataSource() {
  final List<CalendarEmote> calendarEmote = <CalendarEmote>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  calendarEmote.add(CalendarEmote(
      'Conference', startTime, endTime, const Color(0xFFF06292), false));
  return calendarEmote;
}

class CalendarEmoteSource extends CalendarDataSource {
  CalendarEmoteSource(List<CalendarEmote> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class CalendarEmote {
  CalendarEmote(
      this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
