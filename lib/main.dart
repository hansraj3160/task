import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_pluton/view/main_screen.dart';

import 'controller/movie_controller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (controller) => MainScreen(),
      ),
    );
  }
}