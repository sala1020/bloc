import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_api/api/api_services.dart';
import 'package:student_api/model/student_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final Api api;
  StudentBloc({required this.api}) : super(LoadingState()) {
    on<FetchStudentsEvent>(
      (event, emit) async {
        try {
          final List<StudentModel> students = await api.getAllStudents();
          emit(LoadedState(students: students));
        } catch (e) {
          emit(ErrorState(error: '$e'));
        }
      },
    );

    on<AddStudentEvent>(
      (event, emit) async {
        emit(LoadingState());
        await api.createStudent(student: event.newStudent);
        final List<StudentModel> updatedList = await api.getAllStudents();
        emit(LoadedState(students: updatedList));
      },
    );

    on<PickImageEvent>(
      (event, emit) async {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          final imageFile = image.path;
          emit(LoadingState());
          emit(PickImageState(imageUrl: imageFile));
        }
      },
    );

    on<DeleteStudentEvent>(
      (event, emit) async {
        try {
          await api.deleteStudent(studentId: event.studentID);
          emit(StudentDeletedState());
          emit(LoadingState());
          final List<StudentModel> updatedList = await api.getAllStudents();

          emit(LoadedState(students: updatedList));
        } catch (e) {
          emit(const ErrorState(error: 'error on delete'));
        }
      },
    );

    on<EditEvent>((event, emit) async {
      try {
        emit(LoadingState());
        await api.editStudent(
            studentID: event.studentID, student: event.studentModel);
        final List<StudentModel> updatedList = await api.getAllStudents();
        emit(LoadedState(students: updatedList));
      } catch (e) {
        emit(
          ErrorState(error: '$e'),
        );
      }
    });

    on<SearchEvent>(
      (event, emit) async {
        if (event.searchQuery.isEmpty) {
          try {
            emit(LoadingState());
            final List<StudentModel> students = await api.getAllStudents();
            emit(LoadedState(students: students));
          } catch (e) {
            emit(ErrorState(error: '$e'));
          }
        } else {
          try {
            final List<StudentModel> updatedList =
                await api.search(event.searchQuery);
            emit(LoadedState(students: updatedList));
          } catch (e) {
            emit(ErrorState(error: '$e'));
          }
        }
      },
    );
    on<Refresh>((event, emit) async {
      try {
        emit(LoadingState());
        final List<StudentModel> students = await api.getAllStudents();
        emit(LoadedState(students: students));
      } catch (e) {
        print("eroorr$e");
      }
    });
  }
}
