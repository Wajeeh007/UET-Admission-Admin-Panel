import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/forgot_password/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordViewModel viewModel = Get.put(ForgotPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => LoadingOverlay(
          isLoading: viewModel.overlay.value,
          color: Colors.black54,
          progressIndicator: const CircularProgressIndicator(
            strokeWidth: 7.5,
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width/2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/uet_building.png',
                      ),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width/2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/uni_icon.png',
                        width: 134,
                        height: 133,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                            "Check your registered email to create a new password.",
                            style: TextStyle(
                              color: Color.fromRGBO(68, 68, 67, 0.7),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Email",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      color: Color(0xff444443),
                                      fontWeight: FontWeight.w600,
                                    )
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: viewModel.emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromRGBO(208, 135, 76, 0.4),
                                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(208, 135, 76, 0.4),
                                        width: 0.1
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 0.1
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(208, 135, 76, 0.4),
                                        width: 0.1
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(208, 135, 76, 0.4),
                                        width: 0.1
                                    )
                                ),
                                hintText: 'Enter Your Email',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
                              ),
                              cursorColor: Colors.white,
                              validator: (value){
                                if (value == null || value == '') {
                                  return 'Field Cannot Be Empty';
                                }
                                else if (!RegExp(r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$").hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: 354,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(208, 135, 76, 0.60),
                              borderRadius: BorderRadius.circular(36)
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              viewModel.validateAndSubmit();
                            },
                            child: const Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
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
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}
