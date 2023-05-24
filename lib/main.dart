import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'IncomeExpance/HomeScreen.dart';



void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => HomeScreen(),
      },
    ),
  );
}