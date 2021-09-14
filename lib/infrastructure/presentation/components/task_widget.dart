import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/infrastructure/presentation/components/event_data.dart';
import 'package:sapad_v3/infrastructure/presentation/components/event_provider.dart';
import 'package:sapad_v3/infrastructure/presentation/components/event_visualizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;
    if (selectedEvents.isEmpty) {
      return Center(
          child: Text('Não possui cadastro de relatório de emoção',
              style: TextStyle(color: Colors.white, fontSize: 16)));
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(),
      child: SfCalendar(
          view: CalendarView.timelineDay,
          dataSource: EventDataSource(provider.events),
          initialDisplayDate: provider.selectedDate,
          backgroundColor: Colors.black12,
          todayTextStyle: TextStyle(color: Colors.white),
          headerHeight: 0,
          todayHighlightColor: Colors.white,
          timeSlotViewSettings: TimeSlotViewSettings(
            timeTextStyle: TextStyle(color: Colors.white),
          ),
          appointmentBuilder: appointmentBuilder,
          onTap: (details) {
            if (details.appointments == null) return;

            final event = details.appointments!.first;

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventViewPage(event: event)));
          }),
    );
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
          color: event.backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
        ),
      ),
    );
  }
}
