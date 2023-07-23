import 'package:flutter/material.dart';
import 'package:online_admission_web/models/fourth_page_model.dart';
import '../../models/first_page_model.dart';
import '../../models/second_page_model.dart';
import '../../models/third_page_model.dart';

class FormModel{

  bool displayData;
  Icon fieldIcon;
  int containerHeight = 70;
  String? email, name, feeSlip, userID;
  FirstPageModel? firstPageModel;
  SecondPageModel? secondPageModel;
  ThirdPageModel? thirdPageModel;
  List<FourthPageModel> fourthPageDocs;
  bool? feeSlipAccepted, formDetailsAccepted, feeSlipChecked, formDetailsChecked;

  FormModel({
    this.email,
    this.containerHeight = 70,
    this.fieldIcon = const Icon(Icons.keyboard_arrow_down_rounded, size: 22, color: Colors.black,),
    this.displayData = false,
    this.name,
    this.feeSlip,
    this.firstPageModel,
    this.secondPageModel,
    this.thirdPageModel,
    required this.fourthPageDocs,
    this.feeSlipAccepted,
    this.formDetailsAccepted,
    this.userID,
    this.formDetailsChecked,
    this.feeSlipChecked,
  });
}