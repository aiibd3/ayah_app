import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth.dart';
import 'package:islami/tabs/quran.dart';
import 'package:islami/tabs/radio.dart';
import 'package:islami/tabs/sebha.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  List<Widget> tabs = [
    const RadioTab(),
    const SehbaTab(),
    AhadethTab(),
    QuranTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/image/bgi.png",
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "آيه",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/image/radio.png")),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/image/sebha.png")),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/image/quranm.png")),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/image/quran.png")),
                  label: "Quran"),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }
}
