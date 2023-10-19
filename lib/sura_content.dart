import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/sura_model.dart';

class SuraContent extends StatefulWidget {
  const SuraContent({super.key});

  static const String routeName = "suracontent";

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var arge = ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadFile(arge.index);
    }

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/bgi.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            arge.suraName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        body: Card(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            separatorBuilder: (context, index) => Divider(
              indent: 40,
              endIndent: 40,
              thickness: 1,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (context, index) {
              return Text(
                "${verses[index]}(${index + 1})",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: GoogleFonts.elMessiri(
                    fontSize: 25, fontWeight: FontWeight.bold),
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    setState(() {});
  }
}
