import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_admission_web/app_routes.dart';

void main() async{
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAvr2A8r31alUrHqgtSRI0tNgZ0fspyQe0",
        authDomain: "admissionapp-9c884.firebaseapp.com",
        projectId: "admissionapp-9c884",
        storageBucket: "admissionapp-9c884.appspot.com",
        messagingSenderId: "1076091619521",
        appId: "1:1076091619521:web:9b5d8ac1b1ee23a74b2c40",
        measurementId: "G-0LWRQPPXWT"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/initialRoute',
      getPages: appRoutes(),
    );
  }
}