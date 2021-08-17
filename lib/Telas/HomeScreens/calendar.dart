import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      showNavigationArrow: true,
      backgroundColor: Colors.grey,
    );
  }
}

List<CalendarEmote> _getDataSource() {
  final List<CalendarEmote> calendarEmote = <CalendarEmote>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  calendarEmote.add(CalendarEmote(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return calendarEmote;
}

class CalendarEmoteSource extends CalendarDataSource {
  CalendarEmoteSource(List<CalendarEmote> source) {
    appointments:
    source;
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
