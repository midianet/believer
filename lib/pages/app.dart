import 'package:believer/calendar.dart';
import 'package:believer/pages/home.dart';
import 'package:flutter/material.dart';

class SchoolManagement extends StatefulWidget {
  const SchoolManagement({Key? key}) : super(key: key);
  @override
  _SchoolManagementState createState() => _SchoolManagementState();
}

class _SchoolManagementState extends State<SchoolManagement> {
  int _selectedItemIndex = 0;
  final List pages = [
    const HomePage(),
    null,
    null,
    const CalendarPage(),
    null,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: const Color(0xFFF0F0F0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.blueGrey[600]),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.insert_chart),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.done),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.chat_bubble),
              ),
            ],
          ),
          body: pages[_selectedItemIndex]
      ),
    );
  }
}