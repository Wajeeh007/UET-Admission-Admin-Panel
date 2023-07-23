import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/constants.dart';
import 'package:online_admission_web/screens/form_approval/form_approval_viewmodel.dart';
import 'package:online_admission_web/screens/pdf/pdf_view.dart';

class AdmissionFormThree extends StatelessWidget {
  AdmissionFormThree({super.key, this.indexOfAdmissionForm = 0});

  final int indexOfAdmissionForm;

  final FormApprovalViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Obx(() => LoadingOverlay(
          color: Colors.black54,
            progressIndicator: const CircularProgressIndicator(
              strokeWidth: 7.5,
              color: Colors.white,
            ),
            isLoading: viewModel.overlay.value,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
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
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs.length,
                                itemBuilder: (context, index) {
                                  String? key = viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldName;
                                  if (key == 'CNIC or Form-B') {
                                    key = 'CNIC/Form-B';
                                  } else if (key == 'Father or Mother CNIC') {
                                    key = 'Father/Mother CNIC';
                                  }
                                  String? value = viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fileLink;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              key.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(67, 80, 96, 1)
                                              )
                                          ),
                                          SizedBox(
                                                child: Obx(() => viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus == null ? Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () async {
                                                          Get.to(() => PdfView(),
                                                              opaque: false,
                                                              arguments: [{'link': value.toString()}]);
                                                        },
                                                        child: const Text(
                                                          'View',
                                                          style: TextStyle(
                                                            color: Color.fromRGBO(41, 56, 77, 1),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 14,
                                                            decoration: TextDecoration.underline,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width / 8,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: const Color(0x66e3b793),
                                                              borderRadius: BorderRadius.circular(36)
                                                          ),
                                                          child: MaterialButton(
                                                            onPressed: () async {
                                                              viewModel.checkValue.value++;
                                                              viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus = false;
                                                              viewModel.displayForms.refresh();
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
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width / 8,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: const Color.fromRGBO(227, 183, 147, 1),
                                                              borderRadius: BorderRadius.circular(36)
                                                          ),
                                                          child: MaterialButton(
                                                            onPressed: () async {
                                                              viewModel.checkValue.value++;
                                                              viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus = true;
                                                              viewModel.displayForms.refresh();
                                                              // Get.off(() => AdmissionFormTwo(formModel: formModel!,));
                                                            },
                                                            child: const Center(
                                                              child: Text(
                                                                "Accept",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                      ),
                                                    ]
                                              ) : Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus == true ? Colors.green : Colors.red,
                                                      child: Icon(
                                                        viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus == true ? Icons.check : Icons.close,
                                                        size: 19,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus == true ? 'Accepted' : "Rejected",
                                                      style: TextStyle(
                                                        color: viewModel.displayForms[indexOfAdmissionForm].fourthPageDocs[index].fieldStatus == true ? Colors.green : Colors.red,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    )
                                                  ],
                                                ),
                                      ),
                                    ),
                                    ]
                                  ),
                                  ),
                                  );
                                }
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 8,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(227, 183, 147, 1),
                                    borderRadius: BorderRadius.circular(36)
                                ),
                                child: MaterialButton(
                                  onPressed: () async {
                                    if(viewModel.checkValue.value == 9){
                                      await viewModel.getRejectedDocs(indexOfAdmissionForm);
                                    } else{
                                      showToast('Check all documents');
                                    }
                                  },
                                  child: const Center(
                                    child: Text(
                                      "Submit",
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
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 15,
                  child: IconButton(
                      onPressed: () {
                        FormApprovalViewModel formApprovalViewModel = Get.find();
                        for (var element in formApprovalViewModel.displayForms[indexOfAdmissionForm].fourthPageDocs) {
                          element.fieldStatus = null;
                          if(element == formApprovalViewModel.displayForms[indexOfAdmissionForm].fourthPageDocs.last){
                            Get.back();
                          }
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios, size: 25, color: Colors.white,)
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