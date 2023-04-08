import 'dart:math';

import 'package:believer/model/classroom.dart';
import 'package:believer/model/classtype.dart';
import 'package:believer/model/level.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int level = 0; //todo trazer do prefs.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          alignment: Alignment.topCenter,
          color: const Color(0xFFF0F0F0),
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Apr",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF263064),
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                            text: " 2023",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              const Text(
                "Today",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF3E3993),
                ),
              ),
             ],
          ),
        ),
        Positioned(
          top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height - 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildDateColumn("Mon", 8, false),
                      buildDateColumn("Tur", 9, false),
                      buildDateColumn("Wed", 10, true),
                      buildDateColumn("Tru", 11, false),
                      buildDateColumn("Fri", 12, false),
                      buildDateColumn("Sat", 13, false),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10 , right: 10) ,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            setState(() {level = 0;});
                          },
                          child: Text(
                              "Basic",
                              style: TextStyle(
                                color: (level == 0) ? Colors.green : Colors.black26
                              ),
                          ),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            setState(() {level = 1;});
                          },
                        child: Text(
                          "Level 1",
                          style: TextStyle(
                              color: (level == 1) ? Colors.green : Colors.black26
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {level = 2;});
                        },
                        child: Text(
                          "Level 2",
                          style: TextStyle(
                              color: (level == 2) ? Colors.green : Colors.black26
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {level = 4;});
                        },
                        child: Text(
                          "Grammar",
                          style: TextStyle(
                              color: (level == 4) ? Colors.green : Colors.black26
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTaskListItem("07:00 AM", [
                          buildClassDay(7,"Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(7,"Conversation", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("08:00 AM", [
                          buildClassDay(8, "Role Play", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(8, "Convesation", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("09:00 AM", [
                          buildClassDay(9,"Vocabulary", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(9, "Role Play", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("10:00 AM", [
                          buildClassDay(10,"Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(10, "Conversation", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("11:00 AM", [
                          buildClassDay(11, "Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Role Play", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("14:00 AM", [
                            buildClassDay(12, "Vocabulary", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                            buildClassDay(12, "Conversation", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("15:00 AM", [
                          buildClassDay(11, "Role Play", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Conversation", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("16:00 AM", [
                          buildClassDay(11, "Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Vocabulary", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("17:00 AM", [
                          buildClassDay(11,"Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Conversation", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("18:00 AM", [
                          buildClassDay(11, "Listening",Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Vocabulary", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("19:00 AM", [
                          buildClassDay(11,"Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Listening", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                        buildTaskListItem("20:00 AM", [
                          buildClassDay(11, "Conversation", Level.values.elementAt(level), Classtype.ONLINE, "Copiar link"),
                          buildClassDay(11, "Video Activity", Level.values.elementAt(level), Classtype.LOCAL, "")
                        ]),
                      ],),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildTaskListItem(String classdate, List<Classroom> classes) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 10,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5),
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: classdate,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
           buildTaskItem(classes[0]),
          const SizedBox(
            height: 5,
          ),
           buildTaskItem(classes[1]),
        ],
      ),
    );
  }

  Container buildTaskItem(Classroom classroom){
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          //50: 100: 200: 300: 400:  500:  600:  700: 800: 900
          color: classroom.type == Classtype.ONLINE ? Colors.blueGrey[50] : Colors.green[50],
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(right: 10, left: 30),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                classroom.theme, //todo: Rever esse texto
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              buildType(classroom.type),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 9,
                backgroundImage: NetworkImage(
                    classroom.photo),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classroom.teacher,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classroom.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: classroom.type == Classtype.ONLINE ?  Colors.blue : Colors.black
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildDateColumn(String weekDay, int date, bool isActive) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
          color: const Color(0xff402fcc), borderRadius: BorderRadius.circular(10))
          : const BoxDecoration(),
      height: 55,
      width: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weekDay,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Text(
            date.toString(),
            style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildClassDay(int hour, String theme, Level level, Classtype type, String link){
    var _date = DateTime.now();
    var _time = DateTime.utc(_date.year, _date.month, _date.day, hour, 0, 0);
    var _teachers = [
      "Ivahi",
      "Iuri",
      "Bruno",
      "Natalia",
      "Iago",
      "Vitoria",
      "Sarah",
      "Vinni",
      "Carlos"
      "Bia"
    ];
    var _photos = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBhcplevwUKGRs1P-Ps8Mwf2wOwnW_R_JIA&usqp=CAU",
  ];
    var _className = "";
    if(level ==  Level.BASIC){
      _className = "Miami";
    }else if(level == Level.LEVEL_1){
      _className = "Toronto";
    }else if (level == Level.LEVEL_2){
      _className = "Orlando";
    }else if(level == Level.LEVEL_3 ) {
      _className = "New York";
    }else if (level == Level.GRAMMAR){
      _className = "Sidney";
    }
    if(type == Classtype.ONLINE) _className = link;
    int _teacherId = (1 + Random().nextInt(10 - 1)) -1;
    return Classroom(_time, _teachers[_teacherId], _photos[_teacherId], level, type, _className, theme);
  }

  buildType(Classtype type){
    buildLabel(type){
      switch(type){
        case Classtype.ONLINE: return "Online";
        default: return "Local";
      }
    }
    buildColor(type){
      switch(type){
        case Classtype.ONLINE: return Colors.yellow[600];
        default: return Colors.green;
      }
    }
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: buildColor(type),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Text(
        buildLabel(type),
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

}