import 'package:believer/helpers/navigator.dart';
import 'package:believer/pages/app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _scaffoldKey   = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.wait([Future.delayed(const Duration(seconds: 3))])
        .then((values) {
      push(context, const SchoolManagement(), replace: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      key: _scaffoldKey,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 280,
              width: 100,
              child: Container(
                padding: const EdgeInsets.only(top: 180),
                height: 100,
                child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo)
                ),
              ),
            ),
          )
      ),
    );
  }
}
