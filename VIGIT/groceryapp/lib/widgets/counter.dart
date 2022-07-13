import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    required this.count,
    required this.onAdd,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  final int count;
  final void Function()? onAdd;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.remove_rounded),
            onPressed: onRemove,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$count',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_rounded),
            onPressed: onAdd,
          ),
        ),
      ],
    );
  }
}
