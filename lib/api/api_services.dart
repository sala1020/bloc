import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_api/model/student_model.dart';
import 'package:student_api/screens/core/api_constants/apis.dart';

class Api {
  //GetMethod
  ApiConstants obj = ApiConstants();
  Future<List<StudentModel>> getAllStudents() async {
    final response = await http.get(
      Uri.parse(obj.url),
      headers: obj.header,
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)['after exicution'];

      if (responseBody is List) {
        final details =
            responseBody.map((e) => StudentModel.fromJson(e)).toList();
        return details;
      } else {
        throw Exception('Response is not a List');
      }
    } else {
      throw Exception('Error fetching students: ${response.statusCode}');
    }
  }

  //postMehod

  Future<void> createStudent({required StudentModel student}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(obj.url));
      request.headers.addAll(obj.header);
      request.fields['name'] = student.name;
      request.fields['roll_no'] = student.rollNo;
      request.fields['age'] = student.age;
      request.fields['department'] = student.department;
      request.fields['phone'] = student.phone;

      if (student.image!.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            student.image!,
          ),
        );
      }
      await request.send();
    } catch (e) {
      throw Exception('Error Occured:$e');
    }
  }

  //delete
  Future<void> deleteStudent({required int studentId}) async {
    try {
      await http.delete(
        Uri.parse(obj.url),
        headers: obj.header,
        body: jsonEncode(
          {'id': studentId},
        ),
      );
    } catch (e) {
      throw Exception('Error Occured:$e');
    }
  }
  //Edit

  Future<void> editStudent({
    required int studentID,
    required StudentModel student,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(obj.url),
        headers: obj.header,
        body: jsonEncode({
          'id': studentID,
          'name': student.name,
          'roll_no': int.parse(student.rollNo),
          'age': int.parse(student.age),
          'department': student.department,
          'phone': student.phone,
        }),
      );

      if (response.statusCode == 200) {
        print('Success: Student information updated successfully.');
      } else {
        throw Exception(Exception);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //Search
  Future<List<StudentModel>> search(String query) async {
    final response = await http.get(
        Uri.parse('http://studentapp.ashkar.tech/search?q=$query'),
        headers: obj.header);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)['after exicution'];

      if (responseBody is List) {
        final details =
            responseBody.map((e) => StudentModel.fromJson(e)).toList();
        return details;
      } else {
        throw Exception('Response is not a List');
      }
    } else {
      throw Exception('Error fetching students: ${response.statusCode}');
    }
  }
}
