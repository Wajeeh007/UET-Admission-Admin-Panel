import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_viewmodel.dart';
import 'package:online_admission_web/constants.dart';

class HomeViewModel extends GetxController{

  RxString departmentName = 'Select Department'.obs;
  RxString fileName = ''.obs;
  RxMap<String, dynamic> meritListLinks = <String, dynamic>{}.obs;
  RxBool fileNameCheck = false.obs;
  RxBool departmentNameCheck = false.obs;
  Uint8List? csvFile;
  RxString campusName2 = 'Select Campus'.obs;
  RxString departmentName2 = ''.obs;
  RxBool departmentFieldVisibility2 = false.obs;
  RxBool getSeats = false.obs;
  var departmentSeatData = <String, dynamic>{}.obs;
  RxInt reservedSeats = 0.obs;
  RxInt pendingSeats = 0.obs;
  RxInt remainingSeats = 0.obs;
  RxInt totalSeats = 0.obs;

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

  RxList<DropdownMenuItem> departmentList2 = <DropdownMenuItem>[].obs;
  // List<DropdownMenuItem> campusList = [
  //   const DropdownMenuItem(value: 'Select Campus',child: Text('Select Campus', style: TextStyle(fontSize: 17),),),
  //   const DropdownMenuItem(value: 'Peshawar',child: Text('Peshawar', style: TextStyle(fontSize: 17),),),
  //   const DropdownMenuItem(value: 'Jalozai',child: Text('Jalozai', style: TextStyle(fontSize: 17),),),
  //   const DropdownMenuItem(value: 'Abbottabad',child: Text('Abbottabad', style: TextStyle(fontSize: 17)),),
  //   const DropdownMenuItem(value: 'Kohat',child: Text('Kohat', style: TextStyle(fontSize: 17)),),
  //   const DropdownMenuItem(value: 'Bannu',child: Text('Bannu', style: TextStyle(fontSize: 17)),),
  // ];

  List<DropdownMenuItem> campusList2 = [
    const DropdownMenuItem(value: 'Select Campus',child: Text('Select Campus', style: TextStyle(fontSize: 17),),),
    const DropdownMenuItem(value: 'Peshawar',child: Text('Peshawar', style: TextStyle(fontSize: 17),),),
    const DropdownMenuItem(value: 'Jalozai',child: Text('Jalozai', style: TextStyle(fontSize: 17),),),
    const DropdownMenuItem(value: 'Abbottabad',child: Text('Abbottabad', style: TextStyle(fontSize: 17)),),
    const DropdownMenuItem(value: 'Kohat',child: Text('Kohat', style: TextStyle(fontSize: 17)),),
    const DropdownMenuItem(value: 'Bannu',child: Text('Bannu', style: TextStyle(fontSize: 17)),),
  ];

  // changeList(String campus){
  //   departmentList.clear();
  //   departmentList.add(
  //       const DropdownMenuItem(value: 'Select Department',child: Text('Select Department', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),)
  //   );
  //   if(campus == 'Peshawar'){
  //     var departments = [
  //       const DropdownMenuItem(value: 'Mechanical',child: Text('Mechanical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //       const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //       const DropdownMenuItem(value: 'Civil',child: Text('Civil', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Industrial',child: Text('Industrial', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Mechatronics',child: Text('Mechatronics', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Agriculture',child: Text('Agriculture', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Mining',child: Text('Mining', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Chemical',child: Text('Chemical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Computer Sciences',child: Text('Computer Sciences', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value:'System Engineering',child: Text('System Engieering', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //     ];
  //     departmentList.addAll(departments);
  //     departmentList.refresh();
  //   } else if(campus == 'Jalozai'){
  //     var departments = [
  //       const DropdownMenuItem(value: 'Mechanical',child: Text('Mechanical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //       const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //       const DropdownMenuItem(value: 'Civil',child: Text('Civil', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Industrial',child: Text('Industrial', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //       const DropdownMenuItem(value: 'Computer Sciences',child: Text('Computer Sciences', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //     ];
  //     departmentList.addAll(departments);
  //     departmentList.refresh();
  //   } else if(campus == 'Kohat'){
  //     var departments = [
  //       const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //     ];
  //     departmentList.addAll(departments);
  //     departmentList.refresh();
  //   } else if(campus == 'Abbottabad'){
  //     var departments = [
  //       const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //       const DropdownMenuItem(value: 'Architecture',child: Text('Architecture', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //     ];
  //     departmentList.addAll(departments);
  //     departmentList.refresh();
  //   } else if(campus == 'Bannu'){
  //     var departments = [
  //       const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
  //       const DropdownMenuItem(value: 'Civil',child: Text('Civil', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
  //     ];
  //     departmentList.addAll(departments);
  //     departmentList.refresh();
  //   }
  //   else{
  //     return;
  //   }
  // }

  changeList2(String campus){
    departmentList2.clear();
    departmentList2.add(
        const DropdownMenuItem(value: 'Select Department',child: Text('Select Department', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),)
    );
    if(campus == 'Peshawar'){
      var departments = [
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
      ];
      departmentList2.addAll(departments);
      departmentList2.refresh();
    } else if(campus == 'Jalozai'){
      var departments = [
        const DropdownMenuItem(value: 'Mechanical',child: Text('Mechanical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Civil',child: Text('Civil', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Industrial',child: Text('Industrial', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Computer Sciences',child: Text('Computer Sciences', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList2.addAll(departments);
      departmentList2.refresh();
    } else if(campus == 'Kohat'){
      var departments = [
        const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
      ];
      departmentList2.addAll(departments);
      departmentList2.refresh();
    } else if(campus == 'Abbottabad'){
      var departments = [
        const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Architecture',child: Text('Architecture', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList2.addAll(departments);
      departmentList2.refresh();
    } else if(campus == 'Bannu'){
      var departments = [
        const DropdownMenuItem(value: 'Electrical',child: Text('Electrical', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Civil',child: Text('Civil', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList2.addAll(departments);
      departmentList2.refresh();
    }
    else{
      return;
    }
  }

  pickFile()async{
    FilePickerResult? pickedFile = await FilePickerWeb.platform.pickFiles(type: FileType.custom, allowedExtensions: ['csv']);
    if(pickedFile != null){
      csvFile = pickedFile.files.single.bytes;
      fileName.value = pickedFile.files.first.name;
    }
  }

  uploadCSV()async{
    BaseViewModel baseModel = Get.find();
    baseModel.overlay.value = true;
      if(departmentName.value != 'Select Department'){
        if(fileName.value != '') {
          try {
            final ref = FirebaseStorage.instance.ref().child('merit_lists').child(departmentName.value).child(fileName.value);
            final uploadTask = ref.putData(csvFile!, SettableMetadata(contentType: 'text/csv'));
            final snapshot = await uploadTask.whenComplete(() {});
            final downloadURL = await snapshot.ref.getDownloadURL();
            final docRef = FirebaseFirestore.instance.collection('merit_lists').doc(departmentName.value);
            docRef.get().then((doc) async{
              if(doc.exists){
                final data = doc.data();
                if(data == null){
                  return;
                } else{
                  meritListLinks.addAll(data['all_list']);
                  meritListLinks.addAll({
                    '${meritListLinks.length+1}_merit_list': downloadURL,
                  });
                  await docRef.update({
                    'all_list': meritListLinks,
                    'merit_list': downloadURL,
                  });
                }
              } else{
                await docRef.set({
                  'all_list': {'1_merit_list': downloadURL,},
                  'merit_list': downloadURL,
                });
              }
            });
            baseModel.overlay.value = false;
            fileName.value = '';
            departmentName.value == 'Select Department';
            showToast('File has been uploaded');
          } catch (e) {
            baseModel.overlay.value = false;
            showToast(e.toString());
          }
        }
        else{
          baseModel.overlay.value = false;
          fileNameCheck.value = true;
        }
      } else{
        baseModel.overlay.value = false;
        departmentNameCheck.value = true;
      }
    }

  getSeatsData(String name)async{
    BaseViewModel baseModel = Get.find();
    baseModel.overlay.value = true;
    departmentName2.value = name;
    final doc = await FirebaseFirestore.instance.collection('seats_data').doc(campusName2.value);
    final docCheck = await doc.get();
    if(docCheck.exists){
      Map<String, dynamic>? map = docCheck.data();
      final fieldCheck = map?.containsKey(departmentName2.value);
      if(fieldCheck == true){
        departmentSeatData.value = map?[departmentName2.value];
        remainingSeats.value = departmentSeatData['remaining_seats'];
        totalSeats.value = departmentSeatData['total_seats'];
        reservedSeats.value = departmentSeatData['reserved_seats'];
        getSeats.value = true;
        baseModel.overlay.value = false;
      } else{
        baseModel.overlay.value = false;
        totalSeats.value = 0;
        reservedSeats.value = 0;
        remainingSeats.value = 0;
        getSeats.value = false;
        showToast('No data available for ${campusName2.value}, ${departmentName2.value} department');
      }
    } else{
      baseModel.overlay.value = false;
      totalSeats.value = 0;
      reservedSeats.value = 0;
      remainingSeats.value = 0;
      getSeats.value = false;
      showToast('No data available for ${campusName2.value}');
    }
  }
}