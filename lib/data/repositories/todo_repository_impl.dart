import 'package:drift/drift.dart';
import 'package:todomock/data/data_source/local/drift_api/app_database.dart';
import 'package:todomock/data/data_source/local/drift_api/daos/todo_dao.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this.dao);

  final TodoDao dao;

  @override
  Future<int> addToDoItem({
    required String title,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
    required String description,
    required bool mustAlert,
  }) {
    final target = DateTime(year, month, day, hour, minute);

    final entry = TodoItemsCompanion.insert(
      title: title,
      description: description,
      mustAlert: Value(mustAlert),
      alertDue: Value(target),
      progress: const Value(0),
      taskCount: const Value(0),
      createdAt: Value(DateTime.now()),
    );

    return dao.addToDoItem(entry);
  }

  @override
  Future<int> deleteToDoItem(int id) => dao.deleteToDoItem(id);

  @override
  Future<List<TodoItem>> getAllToDoItems() async {
    final rows = await dao.getAllToDoItems();
    return rows;
  }

  @override
  Stream<List<TodoItem>> watchAllToDoItems() {
    return dao.watchAllToDoItems();
  }
}
