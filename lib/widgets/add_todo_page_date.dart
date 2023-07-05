import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_ui/style/add_todo_page_container.dart';
import 'package:login_ui/style/add_todo_page_text.dart';

class AddTodoPageDate extends StatelessWidget {
  final ValueNotifier<DateTime> selectedDate;

  const AddTodoPageDate({super.key, required this.selectedDate});

  String getFormattedDate(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if ((picked != null) && (picked != selectedDate.value)) {
      selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(text: 'Date'),
        const SizedBox(height: 5),
        AddTodoPageContainer(
          color: const Color(0xFF9C89B8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getFormattedDate(DateTime.now()),
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.calendar,
                  color: Color(0xFF9C89B8),
                ),
                onPressed: () {
                  selectDate(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
