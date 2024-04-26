part of 'student_bloc.dart';

sealed class StudentState {
  const StudentState();
}

final class LoadingState extends StudentState {}

final class LoadedState extends StudentState {
  final List<StudentModel> students;
  const LoadedState({required this.students});
}

final class ErrorState extends StudentState {
  final String error;
  const ErrorState({required this.error});
}

final class StudentDeletedState extends StudentState {}

final class PickImageState extends StudentState {
  final String imageUrl;
  const PickImageState({required this.imageUrl});
}
