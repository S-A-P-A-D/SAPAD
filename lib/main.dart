import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/domain/entities/google_sign_in.dart';
import 'package:sapad_v3/infrastructure/presentation/HomeScreens/login.dart';
import 'package:sapad_v3/infrastructure/presentation/action_screens/meditation.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter/services.dart';
import '/infrastructure/presentation/components/event_provider.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GoogleSignInProvider>(
        create: (context) => GoogleSignInProvider(),
      ),
      ChangeNotifierProvider<EventProvider>(
          create: (context) => EventProvider()),
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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
