import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/admission_forms/screen_one.dart';
import '../screens/form_approval/form_approval_viewmodel.dart';
import '../screens/fee_slip/fee_slip_view.dart';

class AdmissionForm extends StatelessWidget {
  AdmissionForm({super.key, this.index});

  final int? index;
  final feedBackText = TextEditingController();
  final FormApprovalViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.infinity,
          height: viewModel.displayForms[index!].containerHeight.toDouble(),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(208, 135, 76, 0.15),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        viewModel.displayForms[index!].name.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    IconButton(
                      onPressed: (){
                        if(viewModel.displayForms[index!].containerHeight == 70){
                            viewModel.displayForms[index!].containerHeight = 410;
                            viewModel.displayForms[index!].fieldIcon = const Icon(Icons.keyboard_arrow_up, size: 22, color: Colors.black,);
                            Future.delayed(const Duration(milliseconds: 550), (){
                              viewModel.displayForms[index!].displayData = true;
                              viewModel.displayForms.refresh();
                            });
                            viewModel.displayForms.refresh();
                          } else {
                          viewModel.displayForms[index!].containerHeight = 70;
                          viewModel.displayForms[index!].fieldIcon = const Icon(
                            Icons.keyboard_arrow_down_rounded, size: 22,
                            color: Colors.black,);
                          viewModel.displayForms[index!].displayData = false;
                          viewModel.displayForms.refresh();
                        }
                        },
                        icon: viewModel.displayForms[index!].fieldIcon),
                  ],
                ),
                Obx(() => Visibility(
                    visible: viewModel.displayForms[index!].displayData,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(248, 246, 244, 0.7),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Admission Form',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        Obx(() => viewModel.displayForms[index!].formDetailsChecked == false ? TextButton(
                                              onPressed: (){
                                                Get.to(() => AdmissionFormOne(indexOfAdmissionForm: index!,), opaque: false);
                                              },
                                              child: const Text(
                                                'Check',
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14
                                                ),
                                              ),
                                          ) : const SizedBox()
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Obx(() => viewModel.displayForms[index!].formDetailsChecked == false ? const SizedBox() : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: viewModel.displayForms[index!].formDetailsAccepted == false ? Colors.red : Colors.green,
                                        child: Center(
                                          child: Icon(
                                            viewModel.displayForms[index!].formDetailsAccepted == false ? Icons.close : Icons.check,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),
                                      Text(
                                        viewModel.displayForms[index!].formDetailsAccepted == false ? 'Rejected' : 'Accepted',
                                        style: TextStyle(
                                          color: viewModel.displayForms[index!].formDetailsAccepted == false ? Colors.red : Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                        ),
                                      )
                                    ],
                                  )
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(248, 246, 244, 0.7),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Fee Slip',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        Obx(() => viewModel.displayForms[index!].feeSlipChecked == false ? TextButton(
                                            onPressed: (){
                                              Get.to(() => FeeSlipView(), opaque: false, arguments: [{
                                                'feeSlipLink': viewModel.displayForms[index!].feeSlip,
                                                'index': index!
                                              }]);
                                            },
                                            child: const Text(
                                              'Check',
                                              style: TextStyle(
                                                decoration: TextDecoration.underline,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14
                                              ),
                                            ),
                                          ) : const SizedBox(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Obx(() => viewModel.displayForms[index!].feeSlipChecked == false ? const SizedBox() : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: viewModel.displayForms[index!].feeSlipAccepted == false ? Colors.red : Colors.green,
                                          child: Center(
                                            child: Icon(
                                              viewModel.displayForms[index!].feeSlipAccepted == false ? Icons.close : Icons.check,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          viewModel.displayForms[index!].feeSlipAccepted == false ? 'Rejected' : 'Accepted',
                                          style: TextStyle(
                                              color: viewModel.displayForms[index!].feeSlipAccepted == false ? Colors.red : Colors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Form(
                                key: viewModel.formKey,
                                child: Expanded(
                                  child: TextFormField(
                                    maxLines: 4,
                                    validator: (value){
                                      if(viewModel.displayForms[index!].formDetailsChecked == false){
                                        return 'Check admission form to submit';
                                      } else{
                                        if(viewModel.displayForms[index!].feeSlipChecked == false){
                                          return 'Check fee slip to submit';
                                        } else{
                                          if(viewModel.displayForms[index!].formDetailsAccepted == false || viewModel.displayForms[index!].feeSlipAccepted == false){
                                            if(value == null || value == ''){
                                              return 'Enter feedback for rejected documents';
                                            } else{
                                              return null;
                                            }
                                          }
                                          return null;
                                        }
                                      }
                                    },
                                    cursorColor: Colors.black,
                                    controller: feedBackText,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xb3f8f6f4),
                                      hintText: 'Type feedback about the issue',
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                      ),
                                      hoverColor: const Color(0xb3f8f6f4),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Color(0xb3f8f6f4),
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Color(0xb3f8f6f4),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Color(0xb3f8f6f4),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Color(0xb3f8f6f4),
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25)
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/9,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(208, 135, 76, 0.60),
                                      borderRadius: BorderRadius.circular(36)
                                  ),
                                  child: MaterialButton(
                                    onPressed: ()async{
                                      await viewModel.validateForm(feedBackText.text, index!);
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
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    ) ,
    );
  }
}