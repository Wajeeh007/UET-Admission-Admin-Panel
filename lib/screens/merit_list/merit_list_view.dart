import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/merit_list/merit_list_viewmodel.dart';
import 'package:get/get.dart';

class MeritListView extends StatelessWidget {
  MeritListView({super.key});

  final MeritListViewModel viewModel = Get.put(MeritListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Obx(() => LoadingOverlay(
        isLoading: viewModel.overlay.value,
        color: Colors.black54,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 6.5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height/1.5,
                width: MediaQuery.of(context).size.width/ 1.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffd1d3da),
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12))
                ),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Color(0xffd1d3da),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    meritListHeading('ETEA Id', MediaQuery.of(Get.context!).size.width/9,),
                                    
                                    meritListHeading('Merit No.', MediaQuery.of(Get.context!).size.width/9),

                                    meritListHeading('Name', MediaQuery.of(Get.context!).size.width/5,),

                                    meritListHeading('F/Name', MediaQuery.of(Get.context!).size.width/5,),

                                    meritListHeading('Aggregate', MediaQuery.of(Get.context!).size.width/8.5,),

                                    meritListHeading('Eligibility', MediaQuery.of(Get.context!).size.width/8.5,),
                                  ],
                                ),
                              )
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: viewModel.meritList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          meritListText(viewModel.meritList[index].eteaNumber.toString(), MediaQuery.of(Get.context!).size.width/9),
                                          meritListText(viewModel.meritList[index].meritNumber.toString(), MediaQuery.of(Get.context!).size.width/9),
                                          meritListText(viewModel.meritList[index].studentName.toString(), MediaQuery.of(Get.context!).size.width/5),
                                          meritListText(viewModel.meritList[index].fatherName.toString(), MediaQuery.of(Get.context!).size.width/5),
                                          meritListText(viewModel.meritList[index].aggregate.toString(), MediaQuery.of(Get.context!).size.width/8.5),
                                          meritListText(viewModel.meritList[index].eligibility.toString(), MediaQuery.of(Get.context!).size.width/8.5),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Color(0xffd1d3da),
                                      thickness: 1.5,
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width/8.3,
                      child: Container(
                        color: const Color(0xffd1d3da),
                        width: 1.5,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width/4.5,
                      child: Container(
                        color: const Color(0xffd1d3da),
                        width: 1.5,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width/2.35,
                      child: Container(
                        color: const Color(0xffd1d3da),
                        width: 1.5,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width/3.62,
                      child: Container(
                        color: const Color(0xffd1d3da),
                        width: 1.5,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width/6.6,
                      child: Container(
                        color: const Color(0xffd1d3da),
                        width: 1.5,
                        height: MediaQuery.of(context).size.height,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 55,
              width: 85,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                  border: Border.all(
                      width: 0.1,
                      color: Color(0x99d0874c)
                  ),
                  color: Color(0x99d0874c)
              ),
              child: TextButton(
                  onPressed: (){
                    Get.back();
                  }, child: const Text(
                'Done',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    fontFamily: 'Poppins'
                ),
              )
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  meritListHeading(String heading, double width){
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          heading,
          overflow: TextOverflow.fade,
          style: const TextStyle(
              color: Color(0xff435060),
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              fontSize: 12
          ),
        ),
      ),
    );
  }

  meritListText(String text, double width){
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.fade,
          style: const TextStyle(
              color: Color(0xff435060),
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              fontSize: 10
          ),
        ),
      ),
    );
  }

}
