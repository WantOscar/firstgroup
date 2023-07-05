import 'package:flutter/cupertino.dart';
import 'package:login_ui/style/add_todo_page_text.dart';
import 'package:login_ui/style/app_color.dart';
import 'package:login_ui/widgets/add_todo_page_color_container.dart';

class AddTodoPagePickColor extends StatelessWidget {
  const AddTodoPagePickColor({super.key});

  @override
  Widget build(BuildContext context) {
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
}
