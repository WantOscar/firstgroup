import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class TodoModel {
  final String? id;
  final String todo;
  final Timestamp? time;
  final bool? isDone;

  // late final String formattedTime;
  String get formattedTime {
    if (time != null) {
      final dateTime = time!.toDate();
      final formatted = DateFormat('HH:mm').format(dateTime); // 시간:분 형식으로 포맷
      return formatted;
    }
    return '';
  }

  TodoModel({
    this.id,
    required this.todo,
    this.time,
    this.isDone,
    required String name,
  });

  factory TodoModel.fromJson(DocumentSnapshot doc) {
    return TodoModel(
      id: doc.id,
      todo: doc['todo'],
      time: doc['time'],
      isDone: doc['isDone'],
      name: '',
    );
  }

  factory TodoModel.toJson(String todo) {
    return TodoModel(todo: todo, name: '');
  }
}

class CategoryModel {
  final String name;
  final Widget page;

  CategoryModel({required this.name, required this.page});
}
