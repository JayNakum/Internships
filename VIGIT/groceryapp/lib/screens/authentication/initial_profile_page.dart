import 'package:flutter/material.dart';
import 'package:shambhoo/screens/main/dashboard.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          'Create New Account',
          style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 140,
                height: 140,
                child: Stack(
                  children: [
                    CircleAvatar(radius: 140),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(76, 175, 80, 1),
                              shape: BoxShape.circle),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(76, 175, 80, 1)),
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(76, 175, 80, 1),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    "Create",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
