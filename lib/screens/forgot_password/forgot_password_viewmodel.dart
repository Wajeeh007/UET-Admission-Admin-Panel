import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/constants.dart';

class ForgotPasswordViewModel extends GetxController {

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool overlay = false.obs;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    else {
      overlay.value = false;
      return false;
    }
  }

  validateAndSubmit() async {
    overlay.value = true;
    if (validateAndSave() == true) {
      try {
        final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
            emailController.text);
        if (methods.isNotEmpty) {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
          overlay.value = false;
          Get.back();
          showToast('A password reset email has been sent');
        }
        else {
          overlay.value = false;
          showToast('Email Not Registered!\nCheck if the email is correct');
        }
      } on FirebaseException catch (e){
        if(e.message!.contains('(auth/session-cookie-expired)')){
          overlay.value = false;
          showToast('Failed to send password reset email.\nTry again.');
        }
        else if(e.message!.contains('(auth/network-request-failed)')){
          overlay.value = false;
          showToast('Servers cannot be reached at the moment due to Network Error.\nCheck your Internet connection and try again');
        }
      }
    }
  }
}