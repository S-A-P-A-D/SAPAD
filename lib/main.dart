import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/Telas/LoginScreens/google_sign_in.dart';
import 'package:sapad_v3/Telas/LoginScreens/login.dart';
import 'package:sapad_v3/Telas/Screens/meditation.dart';
import 'package:sapad_v3/Telas/Screens/timer_provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:workmanager/workmanager.dart';

const myTask = "syncWithTheBackEnd";

Future<void> callbackDispatcher() async {
  Workmanager().executeTask((task, inputdata) {
    switch (task) {
      case myTask:
        print("this method was called from native!");
        break;

      case Workmanager.iOSBackgroundTask:
        print("iOS background fetch delegate ran");
        break;
    }
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  Workmanager()
      .registerPeriodicTask("2", myTask, frequency: Duration(minutes: 1));
  await Firebase?.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GoogleSignInProvider>(
        create: (context) => GoogleSignInProvider(),
      ),
      ChangeNotifierProvider<TimerProvider>(
          create: (context) => TimerProvider(), child: MeditationPage()),
    ],
    child: MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', ''),
        const Locale('en', ''),
        const Locale('es', '')
      ],
      locale: const Locale('pt'),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
