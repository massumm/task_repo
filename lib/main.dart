import 'package:flutter/material.dart';
import 'package:flutter_fz_task/ui/Home.dart';
import 'package:get/get.dart';


import 'api_service/ApiController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiController authController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
