// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TodoModel taskModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String taskModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  final int userId;
  final int id;
  final String title;
  bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
