import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../bloc/student_bloc.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/card_widget.dart';

class Listing extends StatelessWidget {
  const Listing({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentBloc>().add(FetchStudentsEvent());
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        context.read<StudentBloc>().add(Refresh());
      },
      child: Scaffold(
        appBar: appBarWidget(title: 'Students'),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocListener<StudentBloc, StudentState>(
            listener: (context, state) {
              if (state is StudentDeletedState) {
                Get.snackbar(
                  'Deleted',
                  'Successfully Deleted',
                  backgroundColor: const Color.fromARGB(184, 3, 245, 92),
                  duration: const Duration(milliseconds: 800),
                  barBlur: 4,
                );
              }
            },
            child: BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                } else if (state is LoadedState) {
                  return state.students.isNotEmpty
                      ? GridView.builder(
                          itemCount: state.students.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 10 / 17,
                          ),
                          itemBuilder: (context, index) {
                            var studentss = state.students[index];
                            return cardWidget(index: index, student: studentss);
                          },
                        )
                      : const Text('data');
                } else if (state is ErrorState) {
                  return const Center(
                    child: Text(
                      'Empty List',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
