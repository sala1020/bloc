import 'package:flutter/material.dart';

Padding textField(
      {required TextEditingController controller,
      TextInputType? keyboardType,
      Widget? label,
       String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          label: label,
          labelStyle:
              const TextStyle(color: Color.fromARGB(167, 255, 255, 255)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(129, 245, 2, 2)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
      ),
    );
  }