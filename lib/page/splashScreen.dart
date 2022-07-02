import 'dart:async';

import 'package:alquran_indonesia/page/homescreen.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 4);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.white,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new Image.asset(
                "assets/logo_al_quran.png",
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
