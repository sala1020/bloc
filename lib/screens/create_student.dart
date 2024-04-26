import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/screens/controller/student_controller.dart';
import 'package:student_api/screens/core/contants.dart';
import 'widgets/circle_avatar.dart';
import 'widgets/eleveted_button.dart';
import 'widgets/textfield_widget.dart';

class Creating extends StatelessWidget {
  Creating({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final ageController = TextEditingController();
  final departmetController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Student',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatarWidget(controller: controller),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    textField(
                      controller: nameController,
                      label: const Text('Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Plz fill the Name';
                        }
                        return null;
                      },
                    ),
                    kheight15,
                    textField(
                        controller: rollNoController,
                        keyboardType: TextInputType.number,
                        label: const Text('RollNo'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plz fill the RollNo';
                          }
                          return null;
                        }),
                    kheight15,
                    textField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        label: const Text('Age'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plz fill the Age';
                          }
                          return null;
                        }),
                    kheight15,
                    textField(
                        controller: departmetController,
                        label: const Text('Department'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plz fill the Department';
                          }
                          return null;
                        }),
                    kheight15,
                    textField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        label: const Text('Phone No'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plz fill the PhoneNo';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevetedButtonWidget(
                      formKey: formKey,
                      nameController: nameController,
                      rollNoController: rollNoController,
                      ageController: ageController,
                      departmetController: departmetController,
                      phoneController: phoneController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
