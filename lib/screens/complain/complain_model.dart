import 'package:flutter/material.dart';

class ComplainModel{

  String? name, title, department, description, errorText;
  double containerHeight;
  Icon fieldIcon;
  bool displayData, errorTextVisibility;
  GlobalKey? formKey;

  ComplainModel({
    this.name,
    this.title,
    this.description,
    this.department,
    this.displayData = false,
    this.containerHeight = 70,
    this.formKey,
    this.errorText,
    this.errorTextVisibility = false,
    this.fieldIcon = const Icon(Icons.keyboard_arrow_down_rounded, size: 22, color: Colors.black,)
  });

  Map<String, dynamic> toJson() => {

    'name': name,
    'title': title,
    'department': department,
    'description': description,

  };

  factory ComplainModel.fromJson(Map<String, dynamic>json) {
    return ComplainModel(
      name: json['name'],
      title: json['title'],
      department: json['department'],
      description: json['description']
    );
  }

}