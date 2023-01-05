import 'dart:async';

import 'package:alankara/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.PNG"),
            fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.orange,
              size: 50.0,
            ),
          ),
        ),
    );
  }
}
