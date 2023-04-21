import 'package:flutter/material.dart';
import 'package:flutter_challenge/routes/routes.dart';
import 'package:flutter_challenge/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return /*MultiProvider(
      providers: [
        ChangeNotifierProvider<MediaViewModel>(
          create: (_) => MediaViewModel(MediaProvider()),
        ),
      ],
      child: */MaterialApp( 
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
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const Home(),
          );
        },
        /*home: ChangeNotifierProvider<MediaViewModel>(
          create: (_) => MediaViewModel(MediaProvider()),
          child: Home(),
        ),*/
     // )
    );
  }
}