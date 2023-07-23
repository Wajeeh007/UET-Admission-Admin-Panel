import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/fee_slip/fee_slip_viewmodel.dart';

class FeeSlipView extends StatelessWidget {
  FeeSlipView({super.key});

  final FeeSlipViewModel viewModel = Get.put(FeeSlipViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Obx(() => LoadingOverlay(
            isLoading: viewModel.overlay.value,
            progressIndicator: const CircularProgressIndicator(
              strokeWidth: 7.5,
              color: Colors.white,
            ),
            color: Colors.black54,
            child: Stack(
              fit: StackFit.loose,
              children: [
                SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/1.12,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          image: viewModel.feeSlipLink.toString(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width/9,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(208, 135, 76, 0.60),
                                  borderRadius: BorderRadius.circular(36)
                              ),
                              child: MaterialButton(
                                onPressed: ()async{
                                    viewModel.rejectFeeSlip();
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
                            width: 15,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width/9,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(227, 183, 147, 1),
                                  borderRadius: BorderRadius.circular(36)
                              ),
                              child: MaterialButton(
                                onPressed: ()async{
                                  await viewModel.approveFeeSlip();
                                },
                                child: const Center(
                                  child: Text(
                                    "Approve",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 15,
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                  }, icon: const Icon(Icons.arrow_back_ios, size: 27, color: Colors.white,)),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
