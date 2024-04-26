part of 'student_bloc.dart';

sealed class StudentEvent {
  const StudentEvent();
}

final class FetchStudentsEvent extends StudentEvent {}

final class AddStudentEvent extends StudentEvent {
  final StudentModel newStudent;
  const AddStudentEvent({required this.newStudent});
}

class PickImageEvent extends StudentEvent {}

class ClearImage extends StudentEvent {}

class DeleteStudentEvent extends StudentEvent {
  final int studentID;
  DeleteStudentEvent({required this.studentID});
}

class SearchEvent extends StudentEvent {
  final String searchQuery;
  SearchEvent({required this.searchQuery});
}

class EditEvent extends StudentEvent {
  final StudentModel studentModel;
  final int studentID;

  EditEvent({required this.studentModel, required this.studentID});
}
class Refresh extends StudentEvent{}
