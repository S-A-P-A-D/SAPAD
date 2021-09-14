import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/infrastructure/presentation/components/event_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:sapad_v3/infrastructure/presentation/components/task_widget.dart';

import 'event_data.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
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

  void initState() {
    /* readFirebase(); */
    changeIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SafeArea(
      child: SfCalendar(
        view: CalendarView.month,
        initialSelectedDate: DateTime.now(),
        timeZone: 'E. South America Standard Time',
        todayHighlightColor: colors[index],
        cellBorderColor: colors[index],
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.setDate(details.date!);

          showModalBottomSheet(
              context: context, builder: (context) => TaskWidget());
        },
        showNavigationArrow: true,
        cellEndPadding: 3,
        backgroundColor: Colors.black87,
        dataSource: EventDataSource(events),
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
            appointmentDisplayCount: 3,
            showAgenda: false,
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
                    TextStyle(fontSize: 12, color: Colors.grey[800]))),
      ),
    );
  }
}
