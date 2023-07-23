import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/screens/complain/complain_viewmodel.dart';

import '../../widgets/complain_form.dart';

class ComplainView extends StatelessWidget {
  ComplainView({super.key});

  final ComplainViewModel viewModel = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Container(
        width: MediaQuery.of(context).size.width/1.4,
        height: MediaQuery.of(context).size.height/1.4,
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(248, 246, 244, 0.6),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Obx(() => ListView.builder(
                  shrinkWrap: true,
                    itemCount: viewModel.complainsList.length,
                    itemBuilder: (context, index){
                      return ComplainForm(index: index);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
