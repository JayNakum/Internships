import 'package:flutter/material.dart';
import 'package:shambhoo/screens/authentication/splash_screen.dart';
import 'package:shambhoo/screens/main/home/offers.dart';
import 'package:shambhoo/screens/main/home/order_screens/all_orders_screen.dart';
import 'package:shambhoo/screens/main/home/order_screens/order_details_screen.dart';
import 'package:shambhoo/screens/main/home/rating_delivery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: RateDeliveryScreen(),
    );
  }
}
