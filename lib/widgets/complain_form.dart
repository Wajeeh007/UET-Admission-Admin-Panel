import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/constants.dart';
import 'package:online_admission_web/screens/base/base_viewmodel.dart';
import 'package:online_admission_web/screens/complain/complain_viewmodel.dart';

class ComplainForm extends StatelessWidget {

  ComplainForm({super.key, this.index = 0});

  final int index;

  final formKey = GlobalKey<FormState>();
  final feedbackText = TextEditingController();
  final ComplainViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.infinity,
        height: viewModel.complainsList[index].containerHeight.toDouble(),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(208, 135, 76, 0.15),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    viewModel.complainsList[index].name.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff29384d),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                  IconButton(
                      onPressed: (){
                        if(viewModel.complainsList[index].containerHeight == 70){
                          viewModel.complainsList[index].containerHeight = 365;
                          viewModel.complainsList[index].fieldIcon = const Icon(Icons.keyboard_arrow_up, size: 22, color: Colors.black,);
                          Future.delayed(const Duration(milliseconds: 550), (){
                            viewModel.complainsList[index].displayData = true;
                            viewModel.complainsList.refresh();
                          });
                          viewModel.complainsList.refresh();
                        } else {
                          viewModel.complainsList[index].containerHeight = 70;
                          viewModel.complainsList[index].fieldIcon = const Icon(
                            Icons.keyboard_arrow_down_rounded, size: 22,
                            color: Colors.black,);
                          viewModel.complainsList[index].displayData = false;
                          viewModel.complainsList.refresh();
                        }
                      },
                      icon: viewModel.complainsList[index].fieldIcon),
                ],
              ),
              Obx(() => Visibility(
                visible: viewModel.complainsList[index].displayData,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                  "Title",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                viewModel.complainsList[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                  "Department",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                viewModel.complainsList[index].department.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                viewModel.complainsList[index].description.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                  "Feedback",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: feedbackText,
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.top,
                                      validator: (value){
                                        if(value == '' || value == null){
                                          return 'Enter response to submit';
                                        }
                                        else{
                                          return null;
                                        }
                                      },
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        color: Colors.black
                                      ),
                                      decoration: const InputDecoration(
                                        constraints: BoxConstraints(
                                          maxHeight: 30
                                        ),
                                        contentPadding: EdgeInsets.only(bottom: 8),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(112, 112, 112, 1),
                                            width: 1,
                                          )
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(112, 112, 112, 1),
                                            width: 2
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2
                                          )
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(112, 112, 112, 1),
                                            width: 2
                                          )
                                        )
                                      ),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                    ),
                                    Obx(() => Visibility(
                                      visible: viewModel.complainsList[index].errorTextVisibility,
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            viewModel.complainsList[index].errorText.toString(),
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    )
                                  ],
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width/7,
                            height: 55,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(227, 183, 147, 1),
                                borderRadius: BorderRadius.circular(36)
                            ),
                            child: MaterialButton(
                              onPressed: ()async{
                                BaseViewModel baseViewModel = Get.find();
                                baseViewModel.overlay.value = true;
                                if(formKey.currentState!.validate()){
                                  viewModel.complainsList[index].displayData = false;
                                  viewModel.complainsList[index].containerHeight = 70;
                                  viewModel.complainsList.refresh();
                                  Future.delayed(Duration(milliseconds: 550), (){
                                    viewModel.complainsList.removeAt(index);
                                    viewModel.complainsList.refresh();
                                  });
                                  baseViewModel.overlay.value = false;
                                  print('validated');
                                } else{
                                  showToast('Enter Feedback to submit');
                                  baseViewModel.overlay.value = false;
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "Solved",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}