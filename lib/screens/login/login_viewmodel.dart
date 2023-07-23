import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/screens/base/base_view.dart';
import 'package:online_admission_web/constants.dart';

class LoginViewModel extends GetxController{

  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool passwordVisibility = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  validateAndSubmit()async{
    overlay.value = true;
    if(validateAndSave() == true){
      try {
        final newUser = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        if (newUser.runtimeType == UserCredential) {
          final userID = auth.currentUser!.uid;
          final doc = await FirebaseFirestore.instance.collection('user_data').doc(userID);
          final docCheck = await doc.get();
          final isAdmin = docCheck.get('admin');
          if(isAdmin == true){
            final UserName = docCheck.get('name');
            userId = userID;
            userName = UserName;
            userEmail = emailController.text;
            overlay.value = false;
            Get.off(()=>BaseView());
          }
          else{
            overlay.value = false;
            showToast('You\'re not an Admin');
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.message!.contains(('auth/wrong-password'))) {
          overlay.value = false;
          showToast('Incorrect Password');
        }
        else if (e.message!.contains('(auth/user-not-found)')) {
          overlay.value = false;
          showToast('User does not exist.');
        }
        else if (e.message!.contains('(auth/session-cookie-expired)')) {
          overlay.value = false;
          showToast('Failed to Log In.\nTry again.');
        }
        else if (e.message!.contains('(auth/network-request-failed)')) {
          overlay.value = false;
          showToast('Servers cannot be reached at the moment due to Network Error.\nCheck your Internet connection and try again',);
        }
        else {
          overlay.value = false;
          showToast('Cannot log in.\nTry again in a while');
        }
      }
    }
    overlay.value = false;
  }
}