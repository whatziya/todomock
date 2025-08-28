import 'package:todomock/data/data_source/local/drift_api/app_database.dart';

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

  Future<List<TodoItem>> getAllToDoItems();

  Stream<List<TodoItem>> watchAllToDoItems();
}
