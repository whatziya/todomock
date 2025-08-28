import 'package:drift/drift.dart';
import 'package:todomock/data/data_source/local/drift_api/app_database.dart';
import 'package:todomock/data/data_source/local/drift_api/tables/todo_items.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [TodoItems])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(super.db);

  Future<int> addToDoItem(TodoItemsCompanion entry) =>
      into(todoItems).insert(entry);

  Future<bool> updateToDoItem(TodoItem item) =>
      update(todoItems).replace(item);

  Future<int> deleteToDoItem(int id) =>
      (delete(todoItems)..where((tbl) => tbl.id.equals(id))).go();

  Future<TodoItem?> getById(int id) =>
      (select(todoItems)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<List<TodoItem>> getAllToDoItems() => select(todoItems).get();

  Stream<List<TodoItem>> watchAllToDoItems() => select(todoItems).watch();
}
