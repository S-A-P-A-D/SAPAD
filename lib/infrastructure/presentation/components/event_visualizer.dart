import 'package:flutter/material.dart';
import 'package:sapad_v3/infrastructure/presentation/components/appbar_default.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/infrastructure/presentation/components/utils_calendar.dart';
import 'event.dart';

class EventViewPage extends StatelessWidget {
  final Event event;

  const EventViewPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarDefault(
          title: 'Detalhes do relatório de emoção',
          leading: CloseButton(),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(height: 32),
            Text(
              'Título: ' + event.title,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 22),
            Text(
              'Descrição: ' + event.description,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
}
