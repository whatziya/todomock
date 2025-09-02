
import 'package:todomock/domain/entities/to_do_item.dart';

abstract interface class TodoRepository {
  Future<int> addToDoItem({
    required String title,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
    required String description,
    required bool mustAlert,
  });

  Future<int> deleteToDoItem(int id);

  Future<List<ToDoItem>> getAllToDoItems();

  Stream<List<ToDoItem>> watchAllToDoItems();
}
