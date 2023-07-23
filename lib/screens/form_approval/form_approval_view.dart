import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/screens/form_approval/form_approval_viewmodel.dart';

import 'package:online_admission_web/widgets/admission_form.dart';

class FormApprovalView extends StatelessWidget {
  FormApprovalView({super.key});

  final FormApprovalViewModel viewModel = Get.put(FormApprovalViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.4,
      height: MediaQuery.of(context).size.height/1.4,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(248, 246, 244, 0.6),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Check and approve the submitted application.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/4,
                    child: DropdownButtonFormField(
                      dropdownColor: const Color(0xccd0874c),
                      // focusColor: Colors.transparent,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded, size: 30, color: Colors.white,),
                      decoration: const InputDecoration(
                        hintText: 'Select Campus',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Color.fromRGBO(208, 135, 76, 0.4),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(29)),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(29)),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                      ),
                      items: viewModel.campusList,
                      onTap: () {
                        viewModel.departmentFieldVisibility.value = false;
                        viewModel.departmentNameCheck.value = false;
                      },
                      onChanged: (value) {
                        if(value == 'Select Campus'){
                          viewModel.departmentFieldVisibility.value = false;
                          viewModel.campusName.value = value;
                        } else {
                          viewModel.campusName.value = value;
                          viewModel.changeList(value);
                          viewModel.departmentName.value = viewModel.departmentList[0].value;
                          viewModel.departmentFieldVisibility.value = true;
                          viewModel.campusNameCheck.value = false;
                        }
                      },
                      value: viewModel.campusName.value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Obx(() => Visibility(
                    visible: viewModel.campusNameCheck.value,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Select Campus',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Obx(() => viewModel.departmentFieldVisibility.value ? SizedBox(
                    width: MediaQuery.of(context).size.width/4,
                    child: DropdownButtonFormField(
                      menuMaxHeight: 250,
                      dropdownColor: const Color(0xccd0874c),
                      focusColor: Colors.transparent,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30, color: Colors.white,),
                      decoration: const InputDecoration(
                        hintText: 'Select Department',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Color.fromRGBO(
                            208, 135, 76, 0.4),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                      ),
                      items: viewModel.departmentList,
                      onChanged: (value) async{
                        viewModel.departmentName.value = value;
                      },
                      value: viewModel.departmentName.value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ) : Container(),
                  ),
                  Obx(() => Visibility(
                    visible: viewModel.departmentNameCheck.value,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Select Department',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  )
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width/10,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(208, 135, 76, 0.60),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: MaterialButton(
                        onPressed: ()async{
                          if(viewModel.admissionForms.isEmpty){
                            await viewModel.getAdmissionForms();
                          } else{
                            viewModel.changeDisplayList();
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Done",
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
              const SizedBox(
                height: 45,
              ),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: viewModel.displayForms.length,
                  itemBuilder: (context, index){
                    return AdmissionForm(index: index,);
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