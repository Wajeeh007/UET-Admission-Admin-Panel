import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/base/base_viewmodel.dart';
import 'package:online_admission_web/screens/login/login_view.dart';

class BaseView extends StatelessWidget {
  BaseView({super.key});

  final BaseViewModel viewModel = Get.put(BaseViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(() => LoadingOverlay(
              isLoading: viewModel.overlay.value,
              color: Colors.black54,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 7.5,
              ),
              child: Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(243, 240, 237, 0.6),
                      width: 160,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Obx(() =>
                            Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                      'assets/images/uni_icon.png',
                                      width: 74,
                                      height: 73
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 35),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 4,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: viewModel.page.value == 0 ? const Color(0xffD0874C) : const Color.fromRGBO(243, 240, 237, 0.6),
                                            borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(2),
                                                bottom: Radius.circular(2))
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            viewModel.changePage(0);
                                          },
                                          child: Text(
                                            'Home',
                                            style: TextStyle(
                                                color: viewModel.page.value == 0
                                                    ? const Color(0xffD0874C)
                                                    : const Color(0xff29384d),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins'
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 18),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 4,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: viewModel.page.value == 1
                                                ? const Color(0xffD0874C)
                                                : const Color.fromRGBO(
                                                243, 240, 237, 0.6),
                                            borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(2),
                                                bottom: Radius.circular(2))
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          viewModel.changePage(1);
                                        },
                                        child: Text(
                                          'Form Approval',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                              color: viewModel.page.value == 1 ? const Color(0xffD0874C) : const Color(0xff29384d),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 18),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 4,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: viewModel.page.value == 2 ? const Color(0xffD0874C) : const Color.fromRGBO(243, 240, 237, 0.6),
                                            borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(2),
                                                bottom: Radius.circular(2))
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            viewModel.page.value = 2;
                                          },
                                          child: Text(
                                            'Complain',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                                color: viewModel.page.value == 2 ? const Color(0xffD0874C) : const Color(0xff29384d),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1.0, top: 18),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 4,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: viewModel.page.value == 3 ? const Color(0xffD0874C) : const Color.fromRGBO(243, 240, 237, 0.6),
                                            borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(2),
                                                bottom: Radius.circular(2))
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            viewModel.page.value = 3;
                                          },
                                          child: Text(
                                            'Merit History',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                                color: viewModel.page.value == 3 ? const Color(0xffD0874C) : const Color(0xff29384d),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height / 2.8,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3.0, bottom: 50),
                                    child: TextButton(
                                        onPressed: () {
                                          Get.offAll(() => LoginView());
                                        },
                                        child: const Text(
                                          'Logout',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                              color: Color(0xff29384d),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 83,
                                  color: const Color.fromRGBO(67, 80, 96, 0.4),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 48.0, top: 28),
                                    child: Text(
                                      'University of Engineering and Technology, Peshawar',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 65,
                                ),
                                Obx(() => viewModel.pages[viewModel.page.value])
                              ]
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
          ),
    );
  }
}