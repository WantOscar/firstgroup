import 'package:flutter/material.dart';
import 'package:login_ui/style/app_color.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.whiteshade,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFF9C89B8), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 45,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
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
