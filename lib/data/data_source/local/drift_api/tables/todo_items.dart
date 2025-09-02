import 'package:drift/drift.dart';
import 'package:todomock/data/data_source/local/drift_api/app_database.dart';
import 'package:todomock/domain/entities/to_do_item.dart';

class TodoItems extends Table {
  const TodoItems();

  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 6, max: 32)();

  TextColumn get description => text().withLength(min: 0, max: 2048)();

  IntColumn get progress => integer().nullable()();

  IntColumn get taskCount => integer().nullable()();

  BoolColumn get mustAlert => boolean().nullable()();

  DateTimeColumn get alertDue => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();
}

extension ToDoItemMapper on TodoItem {
  ToDoItem toDomain() {
    return ToDoItem(id, title, description, progress ?? 0, taskCount ?? 0);
  }
}
