import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      timeZone: 'E. South America Standard Time',
      todayHighlightColor: Colors.blue,
      cellBorderColor: Colors.blue,
      showNavigationArrow: true,
      cellEndPadding: 3,
      backgroundColor: Colors.black87,
      //dataSource: CalendarEmoteSource(getDataSource()),
      headerStyle: CalendarHeaderStyle(
          backgroundColor: Colors.blue,
          textAlign: TextAlign.center,
          textStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w500,
              letterSpacing: 3,
              color: Colors.white)),
      viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: TextStyle(fontSize: 18, color: Colors.blue)),
      monthViewSettings: MonthViewSettings(
          numberOfWeeksInView: 6,
          appointmentDisplayCount: 3,
          showAgenda: true,
          agendaItemHeight: 40,
          agendaStyle: AgendaStyle(
            backgroundColor: Colors.black12,
            appointmentTextStyle: TextStyle(fontSize: 14, color: Colors.white),
          ),
          dayFormat: 'EEE',
          monthCellStyle: MonthCellStyle(
              textStyle: TextStyle(
                  fontSize: 12, fontFamily: 'Arial', color: Colors.white),
              leadingDatesTextStyle:
                  TextStyle(fontSize: 12, color: Colors.grey[800]))),
    );
  }
}
