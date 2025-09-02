import 'package:get_it/get_it.dart';
import 'package:todomock/data/data_source/local/drift_api/app_database.dart';
import 'package:todomock/data/data_source/local/drift_api/daos/todo_dao.dart';
import 'package:todomock/data/repositories/todo_repository_impl.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {
  // Database layer
  sl
    ..registerLazySingleton<AppDatabase>(AppDatabase.new)

  // Data layer
  ..registerLazySingleton<TodoDao>(() => TodoDao(sl<AppDatabase>()))

  // Domain layer
  ..registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImpl(sl<TodoDao>()),
  );
}