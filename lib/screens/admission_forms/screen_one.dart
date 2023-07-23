import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/admission_forms/screen_two.dart';
import 'package:online_admission_web/screens/form_approval/form_approval_viewmodel.dart';
import 'package:online_admission_web/widgets/admission_form_field.dart';

class AdmissionFormOne extends StatelessWidget {
  AdmissionFormOne({super.key, this.indexOfAdmissionForm = 0});
  
  final int indexOfAdmissionForm;

  final FormApprovalViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Obx(() => LoadingOverlay(
            color: Colors.black54,
            isLoading: viewModel.overlay.value,
            progressIndicator: const CircularProgressIndicator(
              strokeWidth: 7.5,
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0,bottom: 12),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width/1.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
                                child: Align(
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
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  AdmissionFormField(
                                    fieldName: 'Entrance Test ID No',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.eteaID.toString(),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  AdmissionFormField(
                                    fieldName: 'Merit No',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.meritListNo.toString(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                  "Application form for Enrolment to the First Semester",
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
                                    fieldName: 'B.Sc',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.departmentName.toString(),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  AdmissionFormField(
                                    fieldName: 'Engineering',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.campusName.toString(),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                      "Campus",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(67, 80, 96, 1),
                                        fontWeight: FontWeight.w700,
                                      )
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldName: 'Name',
                                fieldWidth: MediaQuery.of(context).size.width/6,
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.studentName.toString(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AdmissionFormField(
                                fieldWidth: MediaQuery.of(context).size.width/6,
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.fatherName.toString(),
                                fieldName: 'Father\'s Name',
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  AdmissionFormField(
                                    fieldName: 'Religion',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.religion.toString(),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  AdmissionFormField(
                                    fieldName: 'Father\'s Occupation',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.fatherOccupation.toString(),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  AdmissionFormField(
                                    fieldName: 'Date of Birth',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.dateOfBirth.toString(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  AdmissionFormField(
                                    fieldName: 'Mobile No',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.mobileNo.toString(),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  AdmissionFormField(
                                    fieldName: 'Nationality',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.nationality.toString(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AdmissionFormField(
                                    fieldName: 'Cnic No',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.cnic.toString(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  AdmissionFormField(
                                    fieldName: 'Status',
                                    fieldData: viewModel.displayForms[indexOfAdmissionForm].firstPageModel!.maritalStatus.toString(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldWidth: MediaQuery.of(context).size.width/3.5,
                                fieldName: 'Present Address',
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.presentAddress.toString(),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldWidth: MediaQuery.of(context).size.width/3.5,
                                fieldName: 'Permanent Address',
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.permanentAddress.toString(),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldName: 'Income Of',
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.incomeSource.toString(),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldName: 'Income In Letters',
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.incomeInLetters.toString(),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.employerName == null ? '' : viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.employerName.toString(),
                                fieldName: 'Name of Employer',
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AdmissionFormField(
                                fieldName: 'Address of Employer',
                                fieldWidth: MediaQuery.of(context).size.width/3.5,
                                fieldData: viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.employerAddress == null ? '' : viewModel.displayForms[indexOfAdmissionForm].secondPageModel!.employerAddress.toString(),
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
                                              'first_page_details': true,
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
                                            Get.off(() => AdmissionFormTwo(indexOfAdmissionForm: indexOfAdmissionForm,));
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
                ),
                Positioned(
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,),
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
