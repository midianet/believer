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
                        buildTaskListItem("07:00 AM","Conversation", "Bruno", "" ,"Miami"),
                        buildTaskListItem("08:00 AM","Conversation", "Guilherme", "" ,"Miami"),
                        buildTaskListItem("09:00 AM","Role Play", "Avahi", "" ,"Miami"),
                        buildTaskListItem("10:00 AM","Vocabulary", "Fernanda", "" ,"Miami"),
                        buildTaskListItem("11:00 AM","Conversation", "Maria", "" ,"Miami"),
                        buildTaskListItem("13:00 AM","Conversation", "Suzane", "" ,"Miami"),
                        buildTaskListItem("14:00 AM","Role Play", "Bruno", "" ,"Miami"),
                        buildTaskListItem("15:00 AM","Conversation", "Fernanda", "" ,"Miami"),
                        buildTaskListItem("16:00 AM","Conversation", "Pedro", "" ,"Miami"),
                        buildTaskListItem("17:00 AM","Vocabulary", "Guilherme", "" ,"Miami"),
                        buildTaskListItem("18:00 AM","Vocabulary", "Tiago", "" ,"Miami"),
                        buildTaskListItem("19:00 AM","Conversation", "Bruno", "" ,"Miami"),
                        buildTaskListItem("20:00 AM","Conversation", "Avahi", "" ,"Miami"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildTaskListItem(String hour, String type, String teacher, String photo, String room ) {
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
                          text: hour,
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
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(right: 10, left: 30),
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 9,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&q=80"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teacher,
                          style: const TextStyle(
                            fontSize: 15,
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
                          room,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
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
}