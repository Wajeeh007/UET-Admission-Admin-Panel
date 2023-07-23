import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class PdfViewModel extends GetxController{

  RxList<Uint8List> documentBytes = <Uint8List>[].obs;
  RxBool docFetched = false.obs;
  RxString url = ''.obs;

  @override
  void onInit() {
    url.value = Get.arguments[0]['link'];
    getDoc();
    super.onInit();
  }

  getDoc()async{

    final pdfRef = FirebaseStorage.instanceFor(
          bucket: 'admissionapp-9c884.appspot.com')
        .refFromURL(url.value);
    await pdfRef.getData(104857600).then((value) {
      documentBytes.add(value!);
      docFetched.value = true;
    });

  }

}