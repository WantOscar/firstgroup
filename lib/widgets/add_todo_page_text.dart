import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPageText extends StatelessWidget {
  final String text;
  const AddTodoPageText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
