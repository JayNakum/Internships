import 'package:flutter/material.dart';
import 'package:shambhoo/screens/main/home/cart.dart';
import 'package:shambhoo/screens/main/home/profile_screen.dart';

import 'home/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: index == 0
                  ? Home()
                  : index == 2
                      ? CartScreen()
                      : index == 4
                          ? ProfileScreen()
                          : SizedBox()),
          Container(
            width: double.infinity,
            height: 53,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Image.asset(
                    "assets/images/home.png",
                    color: index == 0
                        ? Color.fromRGBO(6, 22, 28, 1)
                        : Color.fromRGBO(219, 219, 219, 1),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Image.asset(
                    "assets/images/categories.png",
                    color: index == 1
                        ? Color.fromRGBO(6, 22, 28, 1)
                        : Color.fromRGBO(219, 219, 219, 1),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Image.asset(
                    "assets/images/home.png",
                    color: Colors.transparent,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Image.asset(
                    "assets/images/notes.png",
                    color: index == 3
                        ? Color.fromRGBO(6, 22, 28, 1)
                        : Color.fromRGBO(219, 219, 219, 1),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 4;
                    });
                  },
                  child: Image.asset(
                    "assets/images/user.png",
                    color: index == 4
                        ? Color.fromRGBO(6, 22, 28, 1)
                        : Color.fromRGBO(219, 219, 219, 1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 2;
          });
        },
        child: Center(
          child: Image.asset(
            "assets/images/basket.png",
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        backgroundColor: Color.fromRGBO(76, 175, 80, 1),
      ),
    );
  }
}
