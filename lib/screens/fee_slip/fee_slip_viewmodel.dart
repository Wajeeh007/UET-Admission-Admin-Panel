import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../form_approval/form_approval_viewmodel.dart';

class FeeSlipViewModel extends GetxController{

  RxString feeSlipLink = ''.obs;
  RxInt index = 0.obs;
  RxBool overlay = false.obs;

  @override
  void onInit() {
    feeSlipLink.value = Get.arguments[0]['feeSlipLink'];
    index.value = Get.arguments[0]['index'];
    super.onInit();
  }

  approveFeeSlip()async{
    overlay.value = true;
    FormApprovalViewModel formApprovalViewModel = Get.find();
    await FirebaseFirestore.instance.collection('user_data').doc(formApprovalViewModel.displayForms[index.value].userID).update({
      'fee_slip_checked': true,
      'fee_slip_accepted': true,
    });
    formApprovalViewModel.displayForms[index.value].feeSlipChecked = true;
    formApprovalViewModel.displayForms[index.value].feeSlipAccepted = true;
    overlay.value = false;
    formApprovalViewModel.displayForms.refresh();
    Get.back();
  }

  rejectFeeSlip()async{
    overlay.value = true;
    FormApprovalViewModel formApprovalViewModel = Get.find();
    await FirebaseFirestore.instance.collection('user_data').doc(formApprovalViewModel.displayForms[index.value].userID).update({
      'fee_slip_checked': true,
      'fee_slip_accepted': false,
    });
    formApprovalViewModel.uploadDocsAgain.addAll({
      'Fee Slip': true,
    });
    formApprovalViewModel.displayForms[index.value].feeSlipChecked = true;
    formApprovalViewModel.displayForms[index.value].feeSlipAccepted = false;
    formApprovalViewModel.displayForms.refresh();
    overlay.value = false;
    Get.back();
  }
}