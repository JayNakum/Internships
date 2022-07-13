import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {
        Navigator.of(context).pushNamed(CartScreen.routeName);
      },
      child: const Icon(Icons.shopping_cart_rounded),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      shape: const CircularNotchedRectangle(), //shape of notch
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.dashboard_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.file_copy_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_rounded),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
