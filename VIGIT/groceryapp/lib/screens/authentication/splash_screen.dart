import 'dart:async';

import 'package:flutter/material.dart';

import 'mobile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MobileNumberScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 130,
          ),
          Center(
            child: Image.asset('assets/images/shambhoo_logo.png'),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                child: Image.asset('assets/images/flag.png'),
              ),
              Text(
                'Made in India',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(76, 175, 80, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
