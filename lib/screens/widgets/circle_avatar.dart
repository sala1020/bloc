
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/student_bloc.dart';
import '../controller/student_controller.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.controller,
  });

  final StudentController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        var imageUrl = state is PickImageState ? state.imageUrl : '';
        controller.imageUrll.value = imageUrl;
    
        return GestureDetector(
          onTap: () {
            context.read<StudentBloc>().add(PickImageEvent());
          },
          child: CircleAvatar(
            radius: 60,
            backgroundImage: imageUrl.isEmpty
                ? const AssetImage('assets/profile1.png')
                : Image.file(File(imageUrl)).image,
          ),
        );
      },
    );
  }
}
