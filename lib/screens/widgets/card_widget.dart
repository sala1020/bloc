import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_api/bloc/student_bloc.dart';
import 'package:student_api/model/student_model.dart';
import 'package:student_api/screens/core/contants.dart';
import 'package:student_api/screens/widgets/textfield_widget.dart';

Card cardWidget({required int index, required StudentModel student}) {
  final nameController = TextEditingController(text: student.name);
  final rollNoController = TextEditingController(text: student.rollNo);

  final departmentController = TextEditingController(text: student.department);

  final ageontroller = TextEditingController(text: student.age);

  final phoneController = TextEditingController(text: student.phone);

  return Card(
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<StudentBloc>().add(DeleteStudentEvent(
                            studentID: int.parse(student.id)));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.dialog(AlertDialogue(
                            student: student,
                            nameController: nameController,
                            rollNoController: rollNoController,
                            ageontroller: ageontroller,
                            departmentController: departmentController,
                            phoneController: phoneController));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                );
              },
            )
          ],
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(student.image!),
        ),
        kheight10,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:${student.name}',
                overflow: TextOverflow.ellipsis,
              ),
              kheight10,
              Text('RollNo:${student.rollNo}', overflow: TextOverflow.ellipsis),
              kheight10,
              Text('Age:${student.age}', overflow: TextOverflow.ellipsis),
              kheight10,
              Text('Department:${student.department}',
                  overflow: TextOverflow.ellipsis),
              kheight10,
              Text('PhoneNo:${student.phone}', overflow: TextOverflow.ellipsis),
              // Text('PhoneNo:${student.id}'),
            ],
          ),
        )
      ],
    )),
  );
}

class AlertDialogue extends StatelessWidget {
  const AlertDialogue(
      {super.key,
      required this.nameController,
      required this.rollNoController,
      required this.ageontroller,
      required this.departmentController,
      required this.phoneController,
      required this.student});

  final TextEditingController nameController;
  final TextEditingController rollNoController;
  final TextEditingController ageontroller;
  final TextEditingController departmentController;
  final TextEditingController phoneController;
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField(controller: nameController, label: const Text('Name')),
            const Spacer(),
            textField(
                controller: rollNoController, label: const Text('RollNO')),
            const Spacer(),
            textField(controller: ageontroller, label: const Text('Age')),
            const Spacer(),
            textField(
                controller: departmentController,
                label: const Text('Department')),
            const Spacer(),
            textField(
                controller: phoneController, label: const Text('Phone NO')),
            const Spacer(),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              int studentID = int.parse(student.id);
              StudentModel studentDetails = student.copyWith(
                age: ageontroller.text,
                department: departmentController.text,
                name: nameController.text,
                phone: phoneController.text,
                rollno: rollNoController.text,
              );
              context.read<StudentBloc>().add(EditEvent(
                  studentModel: studentDetails, studentID: studentID));
              Get.back();
            },
            child: const Text(
              'save',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'cancel',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
