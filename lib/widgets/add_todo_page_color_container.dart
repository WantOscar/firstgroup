import 'package:flutter/cupertino.dart';

class AddTodoPageColorContainer extends StatelessWidget {
  final Color color;
  const AddTodoPageColorContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}
