import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  DateTime selectedDate = DateTime.now();

  Widget buildTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget buildContainer({required Widget child}) {
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

  Widget buildColorContainer(Color color) {
    return Container(
      height: 50,
      width: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
    );
  }

  String getFormattedDate() {
    return '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}';
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('Name'),
              buildContainer(
                  child: const SizedBox(width: 300, child: TextField())),
              const SizedBox(
                height: 10,
              ),
              buildTitle('Date'),
              buildContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getFormattedDate(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.calendar,
                          color: Color(0xFF9C89B8)),
                      onPressed: () {
                        selectDate(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildTitle('Category'),
              buildContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.expand_more, color: Color(0xFF9C89B8))],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildTitle('Level Importance'),
              buildContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.expand_more, color: Color(0xFF9C89B8))],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildTitle('Color'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildColorContainer(const Color(0xFFCEEDC7)),
                  buildColorContainer(const Color(0xFFFF9494)),
                  buildColorContainer(const Color(0xFFFFD4B2)),
                  buildColorContainer(const Color(0xFFFFF6BD)),
                  buildColorContainer(const Color(0xFFD7E3FC)),
                  buildColorContainer(const Color(0xFFFFC8DD)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              buildTitle('Set Alarm'),
              buildContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.expand_more, color: Color(0xFF9C89B8))],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildTitle('Time During'),
              buildContainer(
                  child: const SizedBox(width: 300, child: TextField())),
              const SizedBox(height: 30),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF9C89B8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
