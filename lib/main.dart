import 'package:flutter/material.dart';
import 'package:flutter_challenge/view/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: "Flutter Challenge 2023",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white)
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 158, 0, 126),
        ),
        scaffoldBackgroundColor: const Color(0xff0f111d),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
        )
      ),
      initialRoute: '/login',
      routes: routes,
    );
  }
}