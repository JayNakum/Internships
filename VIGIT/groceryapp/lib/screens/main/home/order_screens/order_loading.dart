import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shambhoo/screens/main/home/order_screens/order_details_screen.dart';

class OrderLoadingScreen extends StatefulWidget {
  const OrderLoadingScreen({Key? key}) : super(key: key);

  @override
  State<OrderLoadingScreen> createState() => _OrderLoadingScreenState();
}

class _OrderLoadingScreenState extends State<OrderLoadingScreen> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OrderDetailsScreen())));
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
            child: Text(
              "Please wait while we\nconfirm your order....",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                child: Image.asset(
                  'assets/images/shambhoo_logo.png',
                  width: 88,
                  height: 88,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
