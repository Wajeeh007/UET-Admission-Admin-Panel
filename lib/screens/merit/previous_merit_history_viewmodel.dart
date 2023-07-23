import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/screens/base/base_viewmodel.dart';
import '../../constants.dart';

class MeritViewModel extends GetxController{

  Map<String, dynamic> downloadLinks = <String, dynamic>{};
  RxMap<String, dynamic> downloadLinks1 = <String, dynamic>{}.obs;
  RxString departmentName = 'Select Department'.obs;

  RxList<DropdownMenuItem> departmentList = <DropdownMenuItem>[
    const DropdownMenuItem(value: 'Select Department',child: Text('Select Department', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
    const DropdownMenuItem(value: 'Mechanical',child: Text('Mechanical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
    const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
    const DropdownMenuItem(value: 'Civil',child: Text('Civil', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value: 'Industrial',child: Text('Industrial', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value: 'Mechatronics',child: Text('Mechatronics', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value: 'Agriculture',child: Text('Agriculture', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value: 'Mining',child: Text('Mining', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value: 'Chemical',child: Text('Chemical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value: 'Computer Sciences',child: Text('Computer Sciences', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value:'System Engineering',child: Text('System Engieering', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
    const DropdownMenuItem(value:'Architecture',child: Text('Architecture', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  ].obs;

  getPreviousMerits()async{
    BaseViewModel baseViewModel = Get.find();
    downloadLinks.clear();
    baseViewModel.overlay.value = true;
    await FirebaseFirestore.instance.collection('merit_lists').doc(departmentName.value).get().then((doc){
      final data = doc.data();
      if(data == null){
        baseViewModel.overlay.value = false;
        showToast('No Previous Merit Lists of this department');
      } else{
        downloadLinks.addAll(data['all_list']);
        downloadLinks.forEach((key, value) {
          if(key == '1_merit_list'){
            downloadLinks1.addAll({
              'First Merit': value,
            });
          } else if(key == '2_merit_list'){
            downloadLinks1.addAll({
              'Second Merit': value,
            });
          } else if(key == '3_merit_list'){
            downloadLinks1.addAll({
              'Third Merit': value,
            });
          } else if( key == '4_merit_list'){
            downloadLinks1.addAll({
              'Fourth Merit': value,
            });
          } else {
            downloadLinks1.addAll({
              'Fifth Merit': value,
            });
          }
          downloadLinks1.refresh();
        });
        baseViewModel.overlay.value = false;
      }
    });
  }
}