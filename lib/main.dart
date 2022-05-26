import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // vegetable(thaila: true);
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
      },
    );
  }

  // void vegetable({required bool thaila, int rupees = 100}) {
  //   print("Going for market with Rs $rupees and thaila=$thaila");
  // }
}
