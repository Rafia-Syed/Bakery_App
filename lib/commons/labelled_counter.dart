import 'package:flutter/material.dart';

class LabelledCounter extends StatelessWidget {
  final Function() onDecrementPressed;
  final int value;
  final Function() onIncrementPressed;

  const LabelledCounter(
      {super.key,
      required this.onDecrementPressed,
      required this.value,
      required this.onIncrementPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: onDecrementPressed,
            child: const CircleAvatar(
              backgroundColor: Color(0xffF59C6C),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: Text("$value",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: GestureDetector(
            onTap: onIncrementPressed,
            child: const CircleAvatar(
              backgroundColor: Color(0xffF59C6C),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
