import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/common/di/service_locator.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';
import 'package:todomock/presentation/features/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  final TodoRepository _todoRepository = sl<TodoRepository>();

  Future<void> loadScreen() async {
    try{
      emit(HomeLoading());
      final result = await _todoRepository.getAllToDoItems();
      emit(HomeSuccess(items: result));
    } on Exception catch(_){
      emit(HomeFailure());
    }
  }
}
