import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/constants.dart';
import 'package:online_admission_web/models/first_page_model.dart';
import 'package:online_admission_web/models/fourth_page_model.dart';
import 'package:online_admission_web/models/second_page_model.dart';
import 'package:online_admission_web/models/third_page_model.dart';
import 'package:online_admission_web/screens/base/base_viewmodel.dart';
import 'form_model.dart';

class FormApprovalViewModel extends GetxController {

  RxList<FormModel> admissionForms = <FormModel>[].obs;
  RxBool departmentFieldVisibility = false.obs;
  RxBool campusNameCheck = false.obs;
  RxBool departmentNameCheck = false.obs;
  RxBool check = false.obs;
  final formKey = GlobalKey<FormState>();
  RxBool overlay = false.obs;
  RxString campusName = 'Select Campus'.obs;
  RxString departmentName = ''.obs;
  RxList<FormModel> displayForms = <FormModel>[].obs;
  RxMap<String, dynamic> uploadDocsAgain = <String, dynamic>{}.obs;
  RxInt checkValue = 0.obs;
  RxMap<String, bool> approveForm = <String, bool>{}.obs;
  RxMap<String, int> seatsDataToUpdate = <String, int>{}.obs;

  RxList<DropdownMenuItem> departmentList = <DropdownMenuItem>[].obs;

  List<DropdownMenuItem> campusList = <DropdownMenuItem>[
    const DropdownMenuItem(value: 'Select Campus',
      child: Text('Select Campus', style: TextStyle(fontSize: 17),),),
    const DropdownMenuItem(value: 'Peshawar',
      child: Text('Peshawar', style: TextStyle(fontSize: 17),),),
    const DropdownMenuItem(value: 'Jalozai',
      child: Text('Jalozai', style: TextStyle(fontSize: 17),),),
    const DropdownMenuItem(value: 'Abbottabad',
      child: Text('Abbottabad', style: TextStyle(fontSize: 17)),),
    const DropdownMenuItem(
      value: 'Kohat', child: Text('Kohat', style: TextStyle(fontSize: 17)),),
    const DropdownMenuItem(
      value: 'Bannu', child: Text('Bannu', style: TextStyle(fontSize: 17)),),
  ];

  changeList(String campus) {
    departmentList.clear();
    departmentList.add(
        const DropdownMenuItem(value: 'Select Department',
          child: Text('Select Department', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),)
    );
    if (campus == 'Peshawar') {
      var departments = [
        const DropdownMenuItem(value: 'Mechanical',
          child: Text('Mechanical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Electrical',
          child: Text('Electrical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Civil',
          child: Text('Civil', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Industrial',
          child: Text('Industrial', textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Mechatronics',
          child: Text('Mechatronics', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Agriculture',
          child: Text('Agriculture', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Mining',
          child: Text('Mining', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Chemical',
          child: Text('Chemical', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Computer Sciences',
          child: Text('Computer Sciences', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'System Engineering',
          child: Text('System Engieering', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList.addAll(departments);
      departmentList.refresh();
    } else if (campus == 'Jalozai') {
      var departments = [
        const DropdownMenuItem(value: 'Mechanical',
          child: Text('Mechanical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Electrical',
          child: Text('Electrical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Civil',
          child: Text('Civil', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Industrial',
          child: Text('Industrial', textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
        const DropdownMenuItem(value: 'Computer Sciences',
          child: Text('Computer Sciences', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList.addAll(departments);
      departmentList.refresh();
    } else if (campus == 'Kohat') {
      var departments = [
        const DropdownMenuItem(value: 'Electrical',
          child: Text('Electrical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
      ];
      departmentList.addAll(departments);
      departmentList.refresh();
    } else if (campus == 'Abbottabad') {
      var departments = [
        const DropdownMenuItem(value: 'Electrical',
          child: Text('Electrical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Architecture',
          child: Text('Architecture', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList.addAll(departments);
      departmentList.refresh();
    } else if (campus == 'Bannu') {
      var departments = [
        const DropdownMenuItem(value: 'Electrical',
          child: Text('Electrical', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),),),
        const DropdownMenuItem(value: 'Civil',
          child: Text('Civil', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),),
      ];
      departmentList.addAll(departments);
      departmentList.refresh();
    }
    else {
      return;
    }
  }

  getAdmissionForms() async {
    BaseViewModel viewModel = Get.find();
    viewModel.overlay.value = true;
    QuerySnapshot results = await FirebaseFirestore.instance.collection(
        'user_data').where('documents_accepted', isEqualTo: false).where('application_status', isEqualTo: true).get();
    final List<DocumentSnapshot> forms = results.docs;
    viewModel.overlay.value = false;
    if (forms.isNotEmpty) {
      viewModel.overlay.value = false;
      for (var element in forms) {
        FormModel formModel = FormModel(fourthPageDocs: <FourthPageModel>[]);
        formModel.name = element['name'];
        formModel.email = element['email'];
        formModel.feeSlip = element['fee_slip'];
        formModel.firstPageModel =
            FirstPageModel.fromJson(element['firstPageDetails']);
        formModel.secondPageModel =
            SecondPageModel.fromJson(element['secondPageDetails']);
        formModel.thirdPageModel =
            ThirdPageModel.fromJson(element['thirdPageDetails']);
        Map<String, dynamic> data = element['fourthPageDetails'];
        data.forEach((key, value) {
          formModel.fourthPageDocs.add(FourthPageModel(
              fieldName: key.toString(), fileLink: value.toString()));
        });
        formModel.formDetailsAccepted = element['form_details_accepted'];
        formModel.feeSlipAccepted = element['fee_slip_accepted'];
        formModel.formDetailsChecked = element['form_details_checked'];
        formModel.feeSlipChecked = element['fee_slip_checked'];
        formModel.userID = element['user_id'];
        admissionForms.add(formModel);
        if (element == forms.last) {
          changeDisplayList();
        }
      }
    } else {
      viewModel.overlay.value = false;
      showToast('No admission forms available');
    }
  }

  changeDisplayList() {
    BaseViewModel viewModel = Get.find();
    viewModel.overlay.value = true;
    displayForms.clear();
    for (var element in admissionForms) {
      if (element.firstPageModel?.campusName == campusName.value &&
          element.firstPageModel?.departmentName == departmentName.value) {
        displayForms.add(element);
      }
      if (element == admissionForms.last && displayForms.isEmpty) {
        viewModel.overlay.value = false;
        showToast('No admission forms for ${departmentName.value}, ${campusName
            .value}');
      } else if (element == admissionForms.last && displayForms.isNotEmpty) {
        viewModel.overlay.value = false;
        displayForms.refresh();
      }
    }
  }

  getRejectedDocs(int index) {
    // overlay.value = true;
    uploadDocsAgain.clear();
    displayForms[index].fourthPageDocs.forEach((element) {
      if (element.fieldStatus == false) {
        if (element.fieldName == 'Father/Mother CNIC') {
          element.fieldName = 'Father or Mother CNIC';
        } else if (element.fieldName == 'CNIC/Form-B') {
          element.fieldName = 'CNIC or Form-B';
        }
        uploadDocsAgain.addAll({
          '${element.fieldName}': true,
        });
        check.value = true;
      }
      if (element == displayForms[index].fourthPageDocs.last) {
        if (check.value == true) {
          displayForms[index].formDetailsChecked = true;
          displayForms[index].formDetailsAccepted = false;
          overlay.value = false;
          displayForms.refresh();
          Get.back();
        } else {
          displayForms[index].formDetailsChecked = true;
          displayForms[index].formDetailsAccepted = true;
          approveForm.addAll({
            'form_details_checked': true,
            'form_details_accepted': true,
          });
          displayForms.refresh();
          Get.back();
        }
      }
    });
  }

  validateForm(String? text, int index) {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      uploadData(text, index);
    } else {
      return null;
    }
  }

  uploadData(String? text, int index) async {
    BaseViewModel baseViewModel = Get.find();
    baseViewModel.overlay.value = true;
    if (uploadDocsAgain.isEmpty) {
      approveForm.addAll({
        'documents_accepted': true,
      });
      await FirebaseFirestore.instance.collection('user_data').doc(
          displayForms[index].userID).update(approveForm);
      await FirebaseFirestore.instance.collection('seats_data').doc(
          displayForms[index].firstPageModel?.campusName).get().then((doc) async{
        final data = doc.data();
        if (data == null) {
          return;
        } else {
          int remainingSeats = data[displayForms[index].firstPageModel
              ?.departmentName]['remaining_seats'];
          int reservedSeats = data[displayForms[index].firstPageModel
              ?.departmentName]['reserved_seats'];
          int totalSeats = data[displayForms[index].firstPageModel?.departmentName]['total_seats'];
          remainingSeats--;
          reservedSeats++;
          seatsDataToUpdate.addAll({
              'remaining_seats': remainingSeats,
            'reserved_seats': reservedSeats,
            'total_seats': totalSeats,
            });
          seatsDataToUpdate.refresh();
          await updateSeatsData(index, displayForms[index].firstPageModel!.campusName.toString(), displayForms[index].firstPageModel!.departmentName.toString());
        }
      });
      baseViewModel.overlay.value = false;
      displayForms[index].displayData = false;
      displayForms[index].containerHeight = 70;
      displayForms[index].fieldIcon = const Icon(
        Icons.keyboard_arrow_down_rounded, size: 22, color: Colors.black,);
      displayForms.refresh();
      Future.delayed(const Duration(milliseconds: 550), () {
        displayForms.removeAt(index);
        displayForms.refresh();
      });
    } else {
      uploadDocsAgain.addAll({
        'feedback_message': text.toString(),
      });
      await FirebaseFirestore.instance.collection('user_data').doc(
            displayForms[index].userID).update({
          'form_details_checked': true,
          'form_details_accepted': false,
          'application_status': false,
        });
      await FirebaseFirestore.instance.collection('upload_doc_again').doc(
          displayForms[index].userID).set(uploadDocsAgain);
      baseViewModel.overlay.value = false;
      displayForms[index].containerHeight = 70;
      displayForms[index].fieldIcon = const Icon(
        Icons.keyboard_arrow_down_rounded, size: 22, color: Colors.black,);
      displayForms[index].displayData = false;
      displayForms.refresh();
      Future.delayed(const Duration(milliseconds: 550), () {
        displayForms.removeAt(index);
        displayForms.refresh();
      });
    }
  }

  updateSeatsData(int index, String campusName, String departmentName)async{
    await FirebaseFirestore.instance.collection('seats_data').doc(campusName).update({departmentName:seatsDataToUpdate});
  }

}