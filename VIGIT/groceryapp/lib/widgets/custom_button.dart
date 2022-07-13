import 'package:flutter/material.dart';

/// [CustomElevatedButton] widget is a specially styled button.
/// It is seperated just because it is used multiple times in this app.
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ).copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            // if (states.contains(MaterialState.disabled)) return null;
            return BorderSide(color: Theme.of(context).primaryColor);
            // Defer to the widget's default.
          },
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: child,
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(
        Icons.search_rounded,
        color: Colors.green,
      ),
      label: child,
      onPressed: null,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ).copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            // if (states.contains(MaterialState.disabled)) return null;
            return BorderSide(
              color: Theme.of(context).primaryColor,
            );
            // Defer to the widget's default.
          },
        ),
      ),
    );
  }
}
