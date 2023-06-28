import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui/controller/todo_controller.dart';
import 'package:login_ui/screen/add_todo_page.dart';
import 'package:login_ui/style/app_color.dart';

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
          _Task(),
          _create(),
          _todoList(),
          // const SizedBox(),
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
                      ? GestureDetector(
                          onTap: () => controller.deleteTodo(todoModel.id!),
                          child: const Icon(
                            Icons.check_circle,
                            color: AppColors.lightblue,
                            size: 40,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.updateTodo(todoModel.id!);
                          },
                          child: const Icon(
                            Icons.circle_outlined,
                            color: AppColors.lightblue,
                            size: 40,
                          ),
                        ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Column(
                        children: [
                          Text(todoModel.todo),
                          Text(todoModel.time.toString()),
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

  Widget _Task() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Task',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'today',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
