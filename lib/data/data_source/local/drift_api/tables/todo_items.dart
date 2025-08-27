import 'package:drift/drift.dart';

class TodoItems extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get description => text().withLength(min: 0, max: 2048)();
  BoolColumn get mustAlert  => boolean().nullable()();
  DateTimeColumn get alertDue  => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}
