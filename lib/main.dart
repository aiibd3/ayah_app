import 'package:flutter/material.dart';
import 'package:islami/ahadeth_content.dart';
import 'package:islami/home.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/splash_screen.dart';
import 'package:islami/sura_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: MyThemeData.darkTheme,
      theme: MyThemeData.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        Home.routeName: (context) => const Home(),
        SuraContent.routeName: (context) => const SuraContent(),
        HadethContent.routeName: (context) => const HadethContent()
      },
    );
  }
}
