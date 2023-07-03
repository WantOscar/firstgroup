import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/screen/home.dart';
import 'package:login_ui/style/add_todo_page_container.dart';
import 'package:login_ui/style/add_todo_page_text.dart';
import 'package:login_ui/style/app_color.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  DateTime selectedDate = DateTime.now();

  final categoryValue = ['Work', 'Study', 'Exercise'];
  String? selectedCategory;

  final levelimportanceValue = ['중요', '매우중요', '보통'];
  String? selectedLevelImportance;

  Widget buildColorContainer(Color color) {
    return Container(
      height: 40,
      width: 40,
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
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF9C89B8),
            size: 40,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _name(),
              const SizedBox(height: 20),
              _date(),
              const SizedBox(height: 20),
              _category(),
              const SizedBox(height: 20),
              _levelImportance(),
              const SizedBox(height: 20),
              _pickColor(),
              const SizedBox(height: 20),
              _addBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AddTodoPageText(
          text: 'Name',
        ),
        SizedBox(height: 5),
        AddTodoPageContainer(
          child: SizedBox(
            width: 300,
            child: TextField(),
          ),
        ),
      ],
    );
  }

  Widget _date() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(text: 'Date'),
        const SizedBox(height: 5),
        AddTodoPageContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getFormattedDate(),
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

  Widget _category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(text: 'Category'),
        const SizedBox(height: 5),
        AddTodoPageContainer(
          child: DropdownButton(
            value: selectedCategory,
            isExpanded: true,
            items: categoryValue
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              setState(
                () {
                  selectedCategory = value!;
                },
              );
            },
            icon: const Icon(
              Icons.expand_more,
              color: Color(0xFF9C89B8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _levelImportance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(text: 'Level Importance'),
        const SizedBox(height: 5),
        AddTodoPageContainer(
          child: DropdownButton(
            value: selectedLevelImportance,
            isExpanded: true,
            items: levelimportanceValue
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              setState(
                () {
                  selectedLevelImportance = value!;
                },
              );
            },
            icon: const Icon(
              Icons.expand_more,
              color: Color(0xFF9C89B8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _pickColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(text: 'Pick Color'),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildColorContainer(AppColors.lightGreen),
            buildColorContainer(AppColors.lightRed),
            buildColorContainer(AppColors.lightOrange),
            buildColorContainer(AppColors.lightYellow),
            buildColorContainer(AppColors.lightBlue),
            buildColorContainer(AppColors.lightPink),
          ],
        ),
      ],
    );
  }

  Widget _addBtn() {
    return SizedBox(
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
    );
  }
}
