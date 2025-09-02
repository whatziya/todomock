import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/domain/entities/to_do_item.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';
import 'package:todomock/presentation/features/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TodoRepository _todoRepository;
  StreamSubscription<List<ToDoItem>>? _streamSubscription;

  HomeCubit(this._todoRepository) : super(HomeLoading()) {
    _streamSubscription = _todoRepository.watchAllToDoItems().listen(
      (items) => emit(HomeSuccess(items: items)),
      onError: (_) => emit(HomeFailure()),
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
