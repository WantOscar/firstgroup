import 'package:flutter/material.dart';

class HomeTaskText extends StatelessWidget {
  const HomeTaskText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Task',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'today',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
