import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shambhoo/screens/authentication/otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final maskformatter = MaskTextInputFormatter(
      mask: "(OOO) OOO-OO-OO", filter: {"O": RegExp(r'[0-9]')});
  var textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text('Mobile Number'),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.black,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 68,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/shambhoo_logo.png'),
          ),
          SizedBox(height: 10),
          const Text(
            'Enter your mobile\nnumber',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(6, 22, 28, 1),
            ),
          ),
          SizedBox(height: 15),
          const Text(
            'We will send you a verification\ncode',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(151, 152, 153, 1),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+91',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(6, 22, 28, 1),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: 2,
                height: 18,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 170,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(6, 22, 28, 1),
                        ),
                        controller: textcontroller,
                        inputFormatters: [maskformatter],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '(OOO) OOO-OO-OO',
                          hintStyle: TextStyle(
                            fontSize: 24,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(224, 224, 224, 1),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OTPScreen(phone: textcontroller.text)),
                );
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(6, 22, 28, 1),
                ),
                primary: Colors.white,
                backgroundColor: const Color.fromRGBO(76, 175, 80, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text('Continue'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 55, 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Color.fromRGBO(169, 169, 170, 1),
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                      text:
                          'By clicking on “Continue” you are agreeing to our terms of use'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
