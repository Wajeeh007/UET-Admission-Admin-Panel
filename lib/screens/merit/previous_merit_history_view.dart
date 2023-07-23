import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_admission_web/screens/merit/previous_merit_history_viewmodel.dart';

import '../merit_list/merit_list_view.dart';

class MeritView extends StatelessWidget {
  MeritView({super.key});

  final MeritViewModel viewModel = Get.put(MeritViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Container(
        width: MediaQuery.of(context).size.width/1.6,
        height: MediaQuery.of(context).size.height/1.5,
        decoration: BoxDecoration(
          color: const Color(0x99f8f6f4),
          border: Border.all(
            color: const Color(0x99f8f6f4),
            width: 1
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: const Text(
                  'Check the previous merit list of the departments',
                  style: TextStyle(
                    color: Color(0xff29384d),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
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
                      onChanged: (value) {
                        viewModel.departmentName.value = value;
                      },
                      value: viewModel.departmentName.value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
                          await viewModel.getPreviousMerits();
                        },
                        child: const Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/2.5,
                  decoration: BoxDecoration(
                    color: const Color(0x26d0874c),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: const Color(0x26d0874c),
                      width: 0.1
                    )
                  ),
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: viewModel.downloadLinks1.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color(0xfff8f6f4),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    viewModel.downloadLinks1.entries.elementAt(index).key,
                                    style: const TextStyle(
                                      color: Color(0xff29384d),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        Get.to(() => MeritListView(), opaque: false, arguments: [{
                                          'listLink': viewModel.downloadLinks1.entries.elementAt(index).value,
                                        }]);
                                      },
                                      child: const Text(
                                        'View',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff29384d),
                                            decoration: TextDecoration.underline
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ),
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
