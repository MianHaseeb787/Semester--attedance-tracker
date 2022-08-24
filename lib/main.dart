import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:semester_attendance_tracker/Screens/MainScreen.dart';
import 'package:semester_attendance_tracker/Screens/onboarding_screen.dart';
import 'package:semester_attendance_tracker/model/Datamodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Box box;
// bool firsttime = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // initScreen = prefs.getInt("initScreen")!;
  // await prefs.setInt("initScreen", 1);
  // print('initScreen ${initScreen}');

  // landcape orientation code
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

//onboarding screen bool flag
  final prefs = await SharedPreferences.getInstance();
  final x = prefs.getBool('firsttime') ?? true;

// hive initialization
  await Hive.initFlutter();

  //Records box
  Hive.registerAdapter<Records>(RecordsAdapter());
  Box boxRec = await Hive.openBox<Records>('records');

  //person box
  Hive.registerAdapter<Person>(PersonAdapter());
  box = await Hive.openBox<Person>('person');

  // box.put('newperson', Person(name: 'Name', semester: 1.toString()));

  runApp(MyApp(firsttime: x));
}

class MyApp extends StatelessWidget {
  final bool firsttime;
  const MyApp({Key? key, required this.firsttime}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData.dark(

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          ),

      routes: {
        '/': (context) => OnboardingScreen(),
        'mainScreen': (context) => MainScreen(),
      },
      initialRoute: firsttime == true ? '/' : 'mainScreen',
    );
  }
}
