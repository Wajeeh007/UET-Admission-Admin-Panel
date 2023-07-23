import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/screens/complain/complain_model.dart';

class ComplainViewModel extends GetxController{

  RxList<ComplainModel> complainsList = <ComplainModel>[].obs;

  @override
  void onInit() {
    getComplains();
    super.onInit();
  }

  getComplains()async{
    QuerySnapshot complains = await FirebaseFirestore.instance.collection('complains').get();
    final List<DocumentSnapshot> complainResults = complains.docs;
    if(complainResults.isEmpty){
      return;
    } else{
      for(var complain in complainResults){
        ComplainModel complainModel = ComplainModel();
        complainModel.title = complain['title'];
        complainModel.name = complain['name'];
        complainModel.description = complain['description'];
        complainModel.department = complain['department'];
        complainsList.add(complainModel);
        complainsList.refresh();
      }
    }
  }
}