import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_api/api/api_services.dart';
import 'package:student_api/bloc/student_bloc.dart';
import 'package:student_api/screens/bottomnav/bottom_nav.dart';
import 'screens/controller/student_controller.dart';

void main() {
  Get.put(StudentController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(api: Api()),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white, background: Colors.black),
          appBarTheme: const AppBarTheme(
              color: Colors.black,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 40,
              )),
          useMaterial3: true,
        ),
        home: BottomNav(),
      ),
    );
  }
}
