import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui/controller/todo_controller.dart';
import 'package:login_ui/data/model/todo_model.dart';
import 'package:login_ui/screen/home.dart';
import 'package:login_ui/style/add_todo_page_container.dart';
import 'package:login_ui/style/add_todo_page_text.dart';
import 'package:login_ui/style/app_color.dart';
import 'package:login_ui/style/icon_style.dart';
import 'package:login_ui/widgets/add_todo_page_color_container.dart';
import 'package:login_ui/widgets/add_todo_page_date.dart';
import 'package:login_ui/widgets/add_todo_page_pick_color.dart';

class AddTodoPage extends GetView<TodoController> {
  String? selectedCategory;
  String? selectedLevelImportance;

  AddTodoPage({Key? key}) : super(key: key);

  final ValueNotifier<DateTime> selectedDate =
      ValueNotifier<DateTime>(DateTime.now());

  final categoryValue = ['Work', 'Study', 'Exercise'];

  final levelimportanceValue = ['중요', '매우중요', '보통'];

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: IconStyle.iconArrowBack,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _name(),
              const SizedBox(height: 20),
              // AddTodoPageDate(),
              _date(context),
              const SizedBox(height: 20),
              _category(),
              const SizedBox(height: 20),
              _levelImportance(),
              const SizedBox(height: 20),
              // AddTodoPagePickColor(),
              _pickColor(),
              const SizedBox(height: 20),
              _addBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(
          text: 'Name',
        ),
        const SizedBox(height: 5),
        AddTodoPageContainer(
          color: const Color(0xFF9C89B8),
          child: SizedBox(
            width: 300,
            child: TextField(
              controller: controller.createCon,
            ),
          ),
        ),
      ],
    );
  }

  Widget _date(BuildContext context) {
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

  Widget _category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTodoPageText(text: 'Category'),
        const SizedBox(height: 5),
        AddTodoPageContainer(
          color: const Color(0xFF9C89B8),
          child: DropdownButton(
            value: selectedCategory,
            isExpanded: true,
            items: categoryValue
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
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
          color: const Color(0xFF9C89B8),
          child: DropdownButton(
            value: selectedLevelImportance,
            isExpanded: true,
            items: levelimportanceValue
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
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
          children: const [
            AddTodoPageColorContainer(color: AppColors.lightGreen),
            AddTodoPageColorContainer(color: AppColors.lightRed),
            AddTodoPageColorContainer(color: AppColors.lightOrange),
            AddTodoPageColorContainer(color: AppColors.lightYellow),
            AddTodoPageColorContainer(color: AppColors.lightBlue),
            AddTodoPageColorContainer(color: AppColors.lightPink),
          ],
        ),
      ],
    );
  }

  Widget _addBtn(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF9C89B8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          controller.create(TodoModel);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        child: const Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
