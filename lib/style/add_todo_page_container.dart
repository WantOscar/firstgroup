import 'package:flutter/material.dart';

class AddTodoPageContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const AddTodoPageContainer(
      {super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
      ),
      child: child,
    );
  }
}
