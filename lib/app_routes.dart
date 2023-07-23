import 'package:get/get.dart';
import 'package:online_admission_web/screens/admission_forms/screen_two.dart';
import 'package:online_admission_web/screens/forgot_password/forgot_password_view.dart';
import 'package:online_admission_web/screens/base/base_view.dart';
import 'package:online_admission_web/screens/login/login_view.dart';

appRoutes() => [
  GetPage(
      name: '/initialRoute',
      page: () => LoginView()
  ),
  GetPage(
      name: '/forgotPassword',
      page: () => ForgotPasswordView(),
      transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  // GetPage(
  //     name: '/home',
  //     page: () => HomeView()
  // ),
  GetPage(
      name: '/base',
      page: () => BaseView()
  ),
  GetPage(
      name: '/admissionFormTwo',
      page: () => AdmissionFormTwo()
  )
];