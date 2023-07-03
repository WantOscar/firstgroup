import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui/controller/todo_controller.dart';
import 'package:login_ui/screen/add_todo_page.dart';
import 'package:login_ui/style/app_color.dart';
import 'package:login_ui/widgets/home_task_text.dart';

class HomeScreen extends GetView<TodoController> {
  HomeScreen({super.key});

  void signOut() {
    final auth = FirebaseAuth.instance;
    auth.signOut();
  }

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.sort,
          size: 40,
          color: Color(0xFF9C89B8),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: _title(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AddTodoPage()));
            },
            icon: const Icon(
              Icons.add,
              color: Color(0xFF9C89B8),
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeTaskText(),
          _create(),
          _todoList(),
          _signOut(),
        ],
      ),
    );
  }

  Widget _todoList() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todoModel = controller.todos[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  (todoModel.isDone!)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => controller.deleteTodo(todoModel.id!),
                            child: const Icon(
                              Icons.check_circle,
                              color: AppColors.lightBlue,
                              size: 40,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              controller.updateTodo(todoModel.id!);
                            },
                            child: const Icon(
                              Icons.circle_outlined,
                              color: AppColors.lightBlue,
                              size: 40,
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Container(
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              todoModel.todo,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              todoModel.formattedTime,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _create() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            controller: controller.createCon,
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.create(),
          child: const Icon(Icons.send),
        ),
      ],
    );
  }

  Widget _signOut() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: signOut,
          icon: const Icon(Icons.logout),
          color: const Color(0xFF9C89B8),
          iconSize: 40,
        ),
      ],
    );
  }

  Widget _title() {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Category',
              style: TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.expand_more),
          ),
        ],
      ),
    );
  }
}
