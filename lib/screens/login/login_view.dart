import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:online_admission_web/screens/forgot_password/forgot_password_view.dart';
import 'package:online_admission_web/screens/login/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel viewModel = Get.put(LoginViewModel());

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
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/uni_icon.png',
                          width: 134,
                          height: 133,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                              "Welcome to Admin Portal, please log in to get access to the UET merit results and admission application.",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromRGBO(68, 68, 67, 0.7),
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
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Color(0xff444443),
                                        fontWeight: FontWeight.w700,
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
                                          width: 1
                                      )
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1
                                      )
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(208, 135, 76, 0.4),
                                          width: 1
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(208, 135, 76, 0.4),
                                          width: 1
                                      )
                                  ),
                                  hintText: 'Enter Your Email',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  fontFamily: 'Poppins'
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
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Password",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Color(0xff444443),
                                        fontWeight: FontWeight.w700,
                                      )
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(() => TextFormField(
                                  controller: viewModel.passwordController,
                                  obscureText: viewModel.passwordVisibility.value,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (){
                                          viewModel.passwordVisibility.value = !viewModel.passwordVisibility.value;
                                        }, icon: viewModel.passwordVisibility.value ?  Icon(Icons.visibility_off_outlined, size: 20, color: Colors.white,) : Icon(Icons.visibility_outlined, size: 20, color: Colors.white,)
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(208, 135, 76, 0.4),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(208, 135, 76, 0.4),
                                            width: 1
                                        )
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1
                                        )
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(208, 135, 76, 0.4),
                                            width: 1
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(208, 135, 76, 0.4),
                                            width: 1
                                        )
                                    ),
                                    hintText: 'Enter Your Password',
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                  cursorColor: Colors.white,
                                  validator: (value){
                                    if (value == null || value == '') {
                                      return 'Field Cannot Be Empty';
                                    }
                                    else if (value.length < 8) {
                                      return 'Password must be 8 characters long';
                                    }
                                    else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: (){
                                Get.to(()=>ForgotPasswordView());
                                  }, child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Color(0xff444443),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              fontFamily: 'Poppins'
                            ),
                          ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                  "Login",
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