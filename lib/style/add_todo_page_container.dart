import 'package:flutter/material.dart';

class AddTodoPageContainer extends StatelessWidget {
  final Widget child;
  const AddTodoPageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF9C89B8),
        ),
      ),
      child: child,
    );
  }
}
