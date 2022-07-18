import 'package:flutter/material.dart';

class RateDeliveryScreen extends StatelessWidget {
  const RateDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Your order has been successfully delivered!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 100),
              const Text(
                'Rate this order',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade600,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade600,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade600,
                  ),
                ],
              ),
              const SizedBox(height: 56),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(24.0),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: 'Write your review',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text('Skip'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
