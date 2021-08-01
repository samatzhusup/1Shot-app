import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/theme/app_color.dart';
import 'package:mytest/views/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.black,
              brightness: Brightness.dark
          ),
          scaffoldBackgroundColor: AppColor.black),
      home: HomePage(),
    );
  }
}
