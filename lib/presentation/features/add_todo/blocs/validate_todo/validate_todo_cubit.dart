import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/presentation/features/add_todo/blocs/validate_todo/validate_todo_state.dart';

class ValidateTodoCubit extends Cubit<ValidateTodoState> {
  ValidateTodoCubit() : super(ValidateToDoInitial());

  void validateToDoItem({
    required String title,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
    required bool mustAlert,
  }) {
    emit(ValidateToDoLoading());

    if (title.trim().length < 6) {
      emit(ValidateToDoInvalidTitle());
      return;
    }

    if (mustAlert) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(year, month, day, hour, minute);
      if (selectedDateTime.isBefore(now)) {
        emit(ValidateToDoInvalidTime());
        return;
      }
    }

    emit(ValidateToDoSuccess());
  }
}
