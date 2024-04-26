import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart'; // Importing Get package

import '../controller/student_controller.dart';
import '../create_student.dart';

import '../student_list.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final pages = [
    const Listing(),
    Creating(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentController>();
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        items: const [
          Icon(Icons.list, size: 20),
          Icon(Icons.add, size: 30),
        ],
        index: controller.currentIndex.value,
        onTap: (int newIndex) {
          controller.currentIndex.value = newIndex;
        },
      ),
    );
  }
}
