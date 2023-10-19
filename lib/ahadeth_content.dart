import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/ahadeth_model.dart';

class HadethContent extends StatefulWidget {
  static const String routeName = "hadithContent";

  const HadethContent({super.key});

  @override
  State<HadethContent> createState() => HadethContentState();
}

class HadethContentState extends State<HadethContent> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadAhadethFile();
    }

    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/bgi.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    args.content,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadAhadethFile() async {
    String hadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethContent = hadeth.split("#");

    for (int i = 0; i < ahadethContent.length; i++) {
      List<String> lines = ahadethContent[i].trim().split("\n");
      String title = lines[0];
      lines.removeAt(0);
      List<String> content = lines;
      HadethModel hadethModel = HadethModel(title, content as String);
      allAhadeth.add(hadethModel);
    }

    setState(() {});
  }
}
