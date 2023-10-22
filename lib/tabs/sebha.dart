import 'package:flutter/material.dart';

class SehbaTab extends StatefulWidget {
  @override
  State<SehbaTab> createState() => _SehbaTabState();
}

class _SehbaTabState extends State<SehbaTab> {
  int count = 0;
  double angle = 0;
  int curIndex = 0;
  List<String> text = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .05,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.width * 0.15),
                child: Transform.rotate(
                  angle: angle,
                  child: Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: InkWell(
                      onTap: () {
                        clickOnImage();
                      },
                      child: Image.asset(
                        "assets/image/bodyOfSeb7a.png",
                        height: size.height * .2,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.09, top: size.width * .001),
                child: Image.asset(
                  "assets/image/headOfSeb7a.png",
                  height: size.height * .1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .2,
          ),
          const Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * .075,
            width: size.height * .075,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFB7935F),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "$count",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 100),
            height: size.height * .06,
            width: size.height * .2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFB7935F),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              text[curIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void clickOnImage() {
    angle += 3;
    if (count == 33) {
      count = 0;
      curIndex++;
      curIndex = curIndex % 3;
    }
    count++;
    setState(() {});
  }
}
