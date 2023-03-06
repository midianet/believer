import 'package:believer/helpers/datetime.dart';
import 'package:believer/model/level.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        buildHeader(),
        Container(
          color: Colors.white38,
          height: MediaQuery.of(context).size.height -265,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              buildTitleRow("TODAY CLASSES ", 6),
              const SizedBox(
                height: 5,
              ),
              buildClassItem("07:00","AM","CONVERSATION", Level.BASIC, "MIAMI","Bruno",true),
              buildClassItem("08:00","AM","ROLE PLAY", Level.LEVEL_1, "BOSTON","Guilherme", true),
              buildClassItem("09:00","AM","CONVERSATION", Level.LEVEL_2, "MIAMI","Iago", false),
              buildClassItem("18:00","PM","LISTENING", Level.LEVEL_3, "LA","Thaynara",false),
              buildClassItem("19:00","PM","PHRASAL VERBS", Level.BASIC, "BOSTON","Ivahy", true),
              buildClassItem("20:00","PM","VOCABULARY", Level.BASIC, "MIAMI","Carlos", true),
            ],
          ),
        )
      ],
    );
  }

  buildTaskItem(int numDays, String courseTitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Deadline",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "$numDays days left",
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 100,
            child: Text(
              courseTitle,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  buildTitleRow(String title, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "($number)",
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        ),
      ],
    );
  }

  buildClassItem(String time, String ampm, String title, Level level , String room, String teacher, bool presential) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              presential ? const Icon(Icons.apartment,color: Colors.green) : const Icon(Icons.monitor,color: Colors.deepPurple),
              Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                ampm,
                style:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: Row(
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    buildLevel(level),
                  ],
                ),
              ),
              Row(
                children:[
                  Text(
                    teacher,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              Row(
                  children: [Text(presential? room : "",
                    style: const TextStyle(color: Colors.black, fontSize: 13),)
                  ]
              ),
            ],
          )
        ],
      ),
    );
  }

  buildLevel(Level level){
    buildLabel(level){
      switch(level){
        case Level.LEVEL_1: return "Level 1";
        case Level.LEVEL_2: return "Level 2";
        case Level.LEVEL_3: return "Level 3";
        default: return "Basic";
      }
   }
   buildColor(level){
     switch(level){
       case Level.LEVEL_1: return Colors.yellow[600];
       case Level.LEVEL_2: return Colors.orange[800];
       case Level.LEVEL_3: return Colors.red;
       default: return Colors.green;
     }
   }
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: buildColor(level),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Text(
        buildLabel(level),
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  buildHeader(){
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/topo.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: RichText(
              text: TextSpan(
                  text: getWeekDay(DateTime.now(), true),
                  style: const TextStyle(
                      color: Color(0XFF263064),
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                  children: [
                    TextSpan(
                      text: ' ${DateTime.now().day} ${getMonth(DateTime.now(), true)}',
                      style: const TextStyle(
                          color: Color(0XFF263064),
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    )
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 83, left: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                        blurRadius: 15.0,
                        spreadRadius: -25.5,
                        color: Colors.black,
                      )
                    ],
                    color: Color(0xffdddde1),
                  ),
                ),
                Text(
                  "Marcos Fernando da Costa",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 28,
                    shadows: [
                      BoxShadow(
                        blurRadius: 12.0,
                        spreadRadius: -10.5,
                        color: Colors.black,
                      )
                    ],
                    color: Color(0xffdddde1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}