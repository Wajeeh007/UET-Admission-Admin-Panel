import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_admission_web/screens/complain/complain_view.dart';
import '../form_approval/form_approval_view.dart';
import '../home/home_view.dart';
import '../merit/previous_merit_history_view.dart';

class BaseViewModel extends GetxController{

  RxInt page = 0.obs;
  RxBool overlay = false.obs;

  List<Widget> pages = [
    HomeView(),
    FormApprovalView(),
    ComplainView(),
    MeritView()
  ];

  changePage(int index) {
    page.value = index;
  }

}
