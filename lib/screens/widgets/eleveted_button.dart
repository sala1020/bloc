import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_api/bloc/student_bloc.dart';

import '../../model/student_model.dart';

class ElevetedButtonWidget extends StatelessWidget {
  const ElevetedButtonWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.rollNoController,
    required this.ageController,
    required this.departmetController,
    required this.phoneController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController rollNoController;
  final TextEditingController ageController;
  final TextEditingController departmetController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentBloc, StudentState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (state is PickImageState) {
                context.read<StudentBloc>().add(
                      AddStudentEvent(
                        newStudent: StudentModel(
                          id: '',
                          name: nameController.text,
                          rollNo: rollNoController.text,
                          age: ageController.text,
                          department: departmetController.text,
                          phone: phoneController.text,
                          image: state.imageUrl,
                        ),
                      ),
                    );
                formKey.currentState!.reset();
              } else {
                Get.snackbar('Invalid Image', "Pick An Image",
                    backgroundColor: const Color.fromARGB(255, 248, 85, 85),
                    duration: const Duration(milliseconds: 800));
              }
            }
          },
          child: const Text(
            'Create',
            style: TextStyle(color: Colors.black),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoadedState) {
          Get.snackbar('Creatd', 'Successfully created',
              backgroundColor: const Color.fromARGB(184, 3, 245, 92),
              duration: const Duration(milliseconds: 800),
              barBlur: 4);
        }
      },
    );
  }
}
