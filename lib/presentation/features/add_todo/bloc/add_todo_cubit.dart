import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/common/di/service_locator.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';
import 'package:todomock/presentation/features/add_todo/bloc/add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit() : super(AddToDoInitial());

  final TodoRepository _todoRepository = sl<TodoRepository>();

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
    emit(AddToDoLoading());

    if (title.trim().length < 6) {
      emit(AddToDoInvalidTitle());
      return;
    }

    final now = DateTime.now();
    final selectedDateTime = DateTime(year, month, day, hour, minute);

    if (selectedDateTime.isBefore(now) && mustAlert) {
      if (year < now.year) {
        emit(AddToDoInvalidYear());
      } else if (year == now.year && month < now.month) {
        emit(AddToDoInvalidMonth());
      } else if (year == now.year && month == now.month && day < now.day) {
        emit(AddToDoInvalidDay());
      } else if (year == now.year &&
          month == now.month &&
          day == now.day &&
          hour < now.hour) {
        emit(AddToDoInvalidTime());
      }
      return;
    }

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
    } on Exception catch (_) {
      emit(AddToDoFailure());
    }
  }
}
