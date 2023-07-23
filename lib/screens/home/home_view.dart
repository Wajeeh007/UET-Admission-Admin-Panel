import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel viewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.7,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(248, 246, 244, 0.6),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Text(
                      "Upload department merit list here",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff29384d)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // DropdownButtonFormField(
                  //   dropdownColor: const Color(0xccd0874c),
                  //   focusColor: Colors.transparent,
                  //   isExpanded: true,
                  //   icon: const Icon(
                  //     Icons.keyboard_arrow_down_rounded, size: 30, color: Colors.white,),
                  //   decoration: const InputDecoration(
                  //     hintText: 'Select Campus',
                  //     hintStyle: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //     fillColor: Color.fromRGBO(208, 135, 76, 0.4),
                  //     filled: true,
                  //     contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  //     enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(
                  //             Radius.circular(29)),
                  //         borderSide: BorderSide(
                  //             color: Colors.white,
                  //             width: 1
                  //         )
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(
                  //             Radius.circular(29)),
                  //         borderSide: BorderSide(
                  //             color: Colors.white,
                  //             width: 1
                  //         )
                  //     ),
                  //   ),
                  //   items: viewModel.campusList,
                  //   onTap: () {
                  //     viewModel.departmentFieldVisibility.value = false;
                  //     viewModel.departmentNameCheck.value = false;
                  //   },
                  //   onChanged: (value) {
                  //     if(value == 'Select Campus'){
                  //       viewModel.departmentFieldVisibility.value = false;
                  //       viewModel.campusName.value = value;
                  //     } else {
                  //       viewModel.campusName.value = value;
                  //       viewModel.changeList(value);
                  //       viewModel.departmentName.value = viewModel.departmentList[0].value;
                  //       viewModel.departmentFieldVisibility.value = true;
                  //       viewModel.campusNameCheck.value = false;
                  //     }
                  //   },
                  //   value: viewModel.campusName.value,
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //     Text(
                  //       'Select Campus',
                  //       style: TextStyle(
                  //           color: Colors.red,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // ),
                  DropdownButtonFormField(
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
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  )
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DottedBorder(
                    dashPattern: const [12, 5],
                    color: Colors.grey.shade600,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(25),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: 45,
                            child: Obx(() => viewModel.fileName.value == '' ?
                            MaterialButton(
                              onPressed: () async {
                                await viewModel.pickFile();
                              },
                              child: const Center(
                                child: Text(
                                  'Upload Here',
                                  style: TextStyle(
                                      color: Color(0xff29384d),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ) : Stack(
                              fit: StackFit.loose,
                              children: [
                                Positioned(
                                  top: -8,
                                  right: -5,
                                  child: IconButton(onPressed: (){
                                    viewModel.fileName.value = '';
                                  }, icon: const Icon(Icons.close_outlined, size: 15, color: Colors.black,),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    viewModel.fileName.value,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            )
                        )
                    ),
                  ),
                  Obx(() => Visibility(
                    visible: viewModel.fileNameCheck.value,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Select a file',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w700
                          ),
                        )
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(208, 135, 76, 0.60),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: MaterialButton(
                        onPressed: ()async{
                          await viewModel.uploadCSV();
                        },
                        child: const Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                              fontFamily: 'Poppins',
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
          Container(
            width: MediaQuery.of(context).size.width / 2.7,
            height: MediaQuery.of(context).size.height / 1.45,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(248, 246, 244, 0.6),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: DropdownButtonFormField(
                        enableFeedback: false,
                        dropdownColor: const Color(0xccd0874c),
                        focusColor: Colors.transparent,
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
                        items: viewModel.campusList2,
                        onTap: () {
                          viewModel.departmentFieldVisibility2.value = false;
                        },
                        onChanged: (value) {
                          if(value == 'Select Campus'){
                            viewModel.departmentFieldVisibility2.value = false;
                            viewModel.campusName2.value = value;
                          } else {
                            viewModel.campusName2.value = value;
                            viewModel.changeList2(value);
                            viewModel.departmentName2.value = viewModel.departmentList2[0].value;
                            viewModel.departmentFieldVisibility2.value = true;
                          }
                        },
                        value: viewModel.campusName2.value,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() =>
                    viewModel.departmentFieldVisibility2.value ? DropdownButtonFormField(
                      enableFeedback: false,
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
                        fillColor: Color.fromRGBO(208, 135, 76, 0.4),
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
                      items: viewModel.departmentList2,
                      onChanged: (value) async{
                        await viewModel.getSeatsData(value);
                      },
                      value: viewModel.departmentName2.value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ) : const SizedBox(
                      height: 56,
                    ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Color.fromRGBO(12, 39, 146, viewModel.getSeats.value ? 1 : 0.5),
                              child: CircleAvatar(
                                radius: 38,
                                backgroundColor: const Color.fromRGBO(248, 246, 244, 1),
                                child: Obx(() => Text(
                                  '${viewModel.totalSeats.value}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                "Total Seats",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff29384d),
                                )
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Color.fromRGBO(255, 0, 0, viewModel.getSeats.value ? 1 : 0.5),
                              child: CircleAvatar(
                                radius: 38,
                                backgroundColor: const Color.fromRGBO(248, 246, 244, 1),
                                child: Obx(() => Text('${viewModel.remainingSeats.value}',style: const TextStyle(color: Color(0xff29384d), fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                "Remaining Seats",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff29384d),
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Color.fromRGBO(3, 197, 94, viewModel.getSeats.value ? 1 : 0.5),
                              child: CircleAvatar(
                                  radius: 38,
                                  backgroundColor: const Color.fromRGBO(248, 246, 244, 1),
                                  child: Obx(() => Text(
                                    '${viewModel.reservedSeats.value}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  )
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                "Reserved Seats",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff29384d),
                                  fontFamily: 'Poppins'
                                )
                            ),
                          ],
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
    );
  }
}