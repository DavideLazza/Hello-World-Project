import 'package:flutter/material.dart';
import 'package:hello_world/database/database.dart';
import 'package:hello_world/provider/kilometerdone.dart';
import 'package:hello_world/provider/kilometergoal.dart';
import 'package:hello_world/repository/databaseRepository.dart';
import 'package:hello_world/screen/loginpage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final databaseRepository = DatabaseRepository(database: database);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DatabaseRepository>(
          create: (context) => databaseRepository),
      ChangeNotifierProvider(create: (_) => KilometerGoal()),
      ChangeNotifierProvider(create: (_) => KilometerDone())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(fontFamily: "Poppins"),
              labelLarge: TextStyle(
                fontFamily: "Poppins",
              ))),
      home: const LoginPage(),
    );
  }
}
