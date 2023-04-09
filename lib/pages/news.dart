import 'package:believer/helpers/datetime.dart';
import 'package:believer/model/level.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
              buildNews("Feliz Natal")
            ],
          ),
        )
      ],
    );
  }

  buildNews(String message){
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,

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
                  "News",
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
              ],
            ),
          )
        ],
      ),
    );
  }

}