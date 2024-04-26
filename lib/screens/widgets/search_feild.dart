import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_api/api/debouncer.dart';
import 'package:student_api/bloc/student_bloc.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});
  final deBouncer = DeBouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      itemSize: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      onChanged: (value) {
        deBouncer.call(() =>
            context.read<StudentBloc>().add(SearchEvent(searchQuery: value)));
      },
    );
  }
}
