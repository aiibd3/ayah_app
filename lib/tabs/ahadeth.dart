import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/ahadeth_content.dart';
import 'package:islami/model/ahadeth_model.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => AhadethTabState();
}

class AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      children: [
        Image.asset("assets/image/basmala.png"),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          "الأحاديث",
          style: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              endIndent: 35,
              indent: 35,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethContent.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Center(
                  child: Text(
                    allAhadeth[index].title,
                    style: GoogleFonts.elMessiri(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String hadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethContent = hadeth.split("#");

    for (int i = 0; i < ahadethContent.length; i++) {
      int lastIndex = ahadethContent[i].trim().indexOf("\n");
      String title = ahadethContent[i].trim().substring(0, lastIndex);
      String content = ahadethContent[i].trim().substring(lastIndex + 1);

      HadethModel hadethModel = HadethModel(title, content);
      allAhadeth.add(hadethModel);
    }

    setState(() {});
  }
}
//Another way
/*
for (int i = 0; i < AhadethContent.length; i++) {
  int lastIndex = AhadethContent[i].trim().indexOf("\n");
  String title = AhadethContent[i].trim().substring(0, lastIndex);
  String content = AhadethContent[i].trim().substring(lastIndex + 1);

  HadethModel hadethModel = HadethModel(title, content);
  allAhadeth.add(hadethModel);
}


*/
