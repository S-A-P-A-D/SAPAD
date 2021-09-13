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

  @override
  void initState() {
    changeIndex();
    /* readFirebase(); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CalendarWidget(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: colors[index],
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage()))),
      );
}