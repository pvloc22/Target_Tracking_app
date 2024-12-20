import 'package:equatable/equatable.dart';

class Task{
  int? id;
  String? title;
  String? shortDescription;
  String? dateCreated;
  String? timeCreated;
  String? longDescription;
  String? repeatTask;
  String? reminder;
  String? color;
  bool? isCompleted;

  Task(
      {this.id,
      this.title,
      this.shortDescription,
      this.dateCreated,
      this.timeCreated,
      this.longDescription,
      this.repeatTask,
      this.reminder,
      this.isCompleted,
      this.color});

  factory Task.fromJson(Map<String, dynamic> json)=> Task(
    id: json["id"] as int,
    title: json["title"] as String,
    shortDescription: json["shortDescription"]  ,
    dateCreated: json["dateCreated"],
    timeCreated: json["timeCreated"],
    longDescription: json["longDescription"],
    repeatTask: json["repeatTask"],
    reminder: json["reminder"],
    color: json["color"],
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toJson()=><String, dynamic>{
  'id': this.id,
  'title': this.title,
  'shortDescription': this.shortDescription,
  'dateCreated': this.dateCreated,
  'longDescription': this.longDescription,
  'repeatTask': this.repeatTask,
  'timeCreated': this.timeCreated,
  'reminder': this.reminder,
  'color': this.color,
  'isCompleted': this.isCompleted,
  };
}
