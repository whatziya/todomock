import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';
import 'package:todomock/presentation/features/add_todo/blocs/default_cubit/add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final TodoRepository _todoRepository;

  AddTodoCubit(this._todoRepository) : super(AddToDoInitial());

  Future<void> addToDoItem({
    required String title,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
    required String description,
    required bool mustAlert,
  }) async {
    if (state.isLoading) return;
    emit(AddToDoLoading());
    try {
      await _todoRepository.addToDoItem(
        title: title.trim(),
        year: year,
        month: month,
        day: day,
        hour: hour,
        minute: minute,
        description: description.trim(),
        mustAlert: mustAlert,
      );
      emit(AddToDoSuccess());
    } on Exception {
      emit(AddToDoFailure());
    }
  }
}
