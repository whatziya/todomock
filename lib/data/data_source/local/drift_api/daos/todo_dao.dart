import 'package:drift/drift.dart';
import 'package:todomock/data/data_source/local/drift_api/app_database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [TodoItem])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin{
  TodoDao(super.db);
}
