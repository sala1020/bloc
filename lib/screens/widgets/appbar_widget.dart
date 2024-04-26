import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/student_controller.dart';
import 'search_feild.dart';

AppBar appBarWidget({required String title}) {
  final controller = Get.find<StudentController>();
  return AppBar(
    title: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        child: Obx(
          () => AnimatedCrossFade(
            sizeCurve: Curves.ease,
            reverseDuration: const Duration(milliseconds: 200),
            firstChild: Text(
              title,
              key: UniqueKey(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            secondChild:  SearchField(),
            crossFadeState: controller.isTitle.value == true
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
        )),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton.filled(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.grey)),
          onPressed: () {
            controller.isTitle.value = !controller.isTitle.value;
          },
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
