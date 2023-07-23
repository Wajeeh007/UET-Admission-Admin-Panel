import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/admission_forms/screen_three.dart';
import 'package:online_admission_web/widgets/admission_form_field.dart';
import '../form_approval/form_approval_viewmodel.dart';

class AdmissionFormTwo extends StatelessWidget {
  AdmissionFormTwo({super.key, this.indexOfAdmissionForm = 0});

  final int indexOfAdmissionForm;

  final FormApprovalViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Obx(() => LoadingOverlay(
            isLoading: viewModel.overlay.value,
            color: Colors.black54,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 7.5,
            ),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      width: MediaQuery.of(context).size.width/1.8,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Admission Form',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromRGBO(67, 80, 96, 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                                "Metric  or Equivalent Examination",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(67, 80, 96, 1),
                                  fontWeight: FontWeight.w700,
                                )
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                AdmissionFormField(
                                  fieldName: 'Year',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.year.toString(),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                AdmissionFormField(
                                  fieldName: 'Roll Number',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.rollNumber.toString(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AdmissionFormField(
                              fieldName: 'Name of Board',
                              fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.boardName.toString(),
                              fieldWidth: MediaQuery.of(context).size.width/3.5,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AdmissionFormField(
                              fieldName: 'Paper Type',
                              fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.paperType.toString(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AdmissionFormField(
                              fieldName: 'Marks Obtained',
                              fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.obtainedMarks.toString(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                AdmissionFormField(
                                  fieldName: 'Total Marks',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.totalMarks.toString(),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                AdmissionFormField(
                                  fieldName: 'Percentage',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.percentage.toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                                "Intermediate  or Equivalent Examination",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(67, 80, 96, 1),
                                  fontWeight: FontWeight.w700,
                                )
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                AdmissionFormField(
                                  fieldName: 'Year',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.year.toString(),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                AdmissionFormField(
                                  fieldName: 'Roll Number',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.rollNo.toString(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AdmissionFormField(
                              fieldName: 'Name of Board',
                              fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.boardName.toString(),
                              fieldWidth: MediaQuery.of(context).size.width/3.5,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AdmissionFormField(
                              fieldName: 'Paper Type',
                              fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.paperType.toString(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AdmissionFormField(
                              fieldName: 'Marks Obtained',
                              fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.obtainedMarks.toString(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                AdmissionFormField(
                                  fieldName: 'Total Marks',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.totalMarks.toString(),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                AdmissionFormField(
                                  fieldName: 'Percentage',
                                  fieldData: viewModel.displayForms[indexOfAdmissionForm].thirdPageModel!.percentage.toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width/8,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(227, 183, 147, 0.4),
                                          borderRadius: BorderRadius.circular(36)
                                      ),
                                      child: MaterialButton(
                                        onPressed: ()async{
                                          viewModel.uploadDocsAgain.addAll({
                                            'second_page_details': true
                                          });
                                          viewModel.displayForms[indexOfAdmissionForm].formDetailsChecked = true;
                                          viewModel.displayForms[indexOfAdmissionForm].formDetailsAccepted = false;
                                          viewModel.displayForms.refresh();
                                          Get.back();
                                        },
                                        child: const Center(
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      )
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width/8,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(227, 183, 147, 1),
                                          borderRadius: BorderRadius.circular(36)
                                      ),
                                      child: MaterialButton(
                                        onPressed: ()async{
                                          Get.off(() => AdmissionFormThree(indexOfAdmissionForm: indexOfAdmissionForm,));
                                        },
                                        child: const Center(
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 15,
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}