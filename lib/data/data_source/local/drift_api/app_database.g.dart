// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 2048,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taskCountMeta = const VerificationMeta(
    'taskCount',
  );
  @override
  late final GeneratedColumn<int> taskCount = GeneratedColumn<int>(
    'task_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mustAlertMeta = const VerificationMeta(
    'mustAlert',
  );
  @override
  late final GeneratedColumn<bool> mustAlert = GeneratedColumn<bool>(
    'must_alert',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("must_alert" IN (0, 1))',
    ),
  );
  static const VerificationMeta _alertDueMeta = const VerificationMeta(
    'alertDue',
  );
  @override
  late final GeneratedColumn<DateTime> alertDue = GeneratedColumn<DateTime>(
    'alert_due',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    progress,
    taskCount,
    mustAlert,
    alertDue,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodoItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('task_count')) {
      context.handle(
        _taskCountMeta,
        taskCount.isAcceptableOrUnknown(data['task_count']!, _taskCountMeta),
      );
    }
    if (data.containsKey('must_alert')) {
      context.handle(
        _mustAlertMeta,
        mustAlert.isAcceptableOrUnknown(data['must_alert']!, _mustAlertMeta),
      );
    }
    if (data.containsKey('alert_due')) {
      context.handle(
        _alertDueMeta,
        alertDue.isAcceptableOrUnknown(data['alert_due']!, _alertDueMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      ),
      taskCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}task_count'],
      ),
      mustAlert: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}must_alert'],
      ),
      alertDue: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}alert_due'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String description;
  final int? progress;
  final int? taskCount;
  final bool? mustAlert;
  final DateTime? alertDue;
  final DateTime? createdAt;
  const TodoItem({
    required this.id,
    required this.title,
    required this.description,
    this.progress,
    this.taskCount,
    this.mustAlert,
    this.alertDue,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || progress != null) {
      map['progress'] = Variable<int>(progress);
    }
    if (!nullToAbsent || taskCount != null) {
      map['task_count'] = Variable<int>(taskCount);
    }
    if (!nullToAbsent || mustAlert != null) {
      map['must_alert'] = Variable<bool>(mustAlert);
    }
    if (!nullToAbsent || alertDue != null) {
      map['alert_due'] = Variable<DateTime>(alertDue);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
      taskCount: taskCount == null && nullToAbsent
          ? const Value.absent()
          : Value(taskCount),
      mustAlert: mustAlert == null && nullToAbsent
          ? const Value.absent()
          : Value(mustAlert),
      alertDue: alertDue == null && nullToAbsent
          ? const Value.absent()
          : Value(alertDue),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      progress: serializer.fromJson<int?>(json['progress']),
      taskCount: serializer.fromJson<int?>(json['taskCount']),
      mustAlert: serializer.fromJson<bool?>(json['mustAlert']),
      alertDue: serializer.fromJson<DateTime?>(json['alertDue']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'progress': serializer.toJson<int?>(progress),
      'taskCount': serializer.toJson<int?>(taskCount),
      'mustAlert': serializer.toJson<bool?>(mustAlert),
      'alertDue': serializer.toJson<DateTime?>(alertDue),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TodoItem copyWith({
    int? id,
    String? title,
    String? description,
    Value<int?> progress = const Value.absent(),
    Value<int?> taskCount = const Value.absent(),
    Value<bool?> mustAlert = const Value.absent(),
    Value<DateTime?> alertDue = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
  }) => TodoItem(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    progress: progress.present ? progress.value : this.progress,
    taskCount: taskCount.present ? taskCount.value : this.taskCount,
    mustAlert: mustAlert.present ? mustAlert.value : this.mustAlert,
    alertDue: alertDue.present ? alertDue.value : this.alertDue,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  TodoItem copyWithCompanion(TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      progress: data.progress.present ? data.progress.value : this.progress,
      taskCount: data.taskCount.present ? data.taskCount.value : this.taskCount,
      mustAlert: data.mustAlert.present ? data.mustAlert.value : this.mustAlert,
      alertDue: data.alertDue.present ? data.alertDue.value : this.alertDue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('progress: $progress, ')
          ..write('taskCount: $taskCount, ')
          ..write('mustAlert: $mustAlert, ')
          ..write('alertDue: $alertDue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    progress,
    taskCount,
    mustAlert,
    alertDue,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.progress == this.progress &&
          other.taskCount == this.taskCount &&
          other.mustAlert == this.mustAlert &&
          other.alertDue == this.alertDue &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int?> progress;
  final Value<int?> taskCount;
  final Value<bool?> mustAlert;
  final Value<DateTime?> alertDue;
  final Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.progress = const Value.absent(),
    this.taskCount = const Value.absent(),
    this.mustAlert = const Value.absent(),
    this.alertDue = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.progress = const Value.absent(),
    this.taskCount = const Value.absent(),
    this.mustAlert = const Value.absent(),
    this.alertDue = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       description = Value(description);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? progress,
    Expression<int>? taskCount,
    Expression<bool>? mustAlert,
    Expression<DateTime>? alertDue,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (progress != null) 'progress': progress,
      if (taskCount != null) 'task_count': taskCount,
      if (mustAlert != null) 'must_alert': mustAlert,
      if (alertDue != null) 'alert_due': alertDue,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<int?>? progress,
    Value<int?>? taskCount,
    Value<bool?>? mustAlert,
    Value<DateTime?>? alertDue,
    Value<DateTime?>? createdAt,
  }) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      progress: progress ?? this.progress,
      taskCount: taskCount ?? this.taskCount,
      mustAlert: mustAlert ?? this.mustAlert,
      alertDue: alertDue ?? this.alertDue,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (taskCount.present) {
      map['task_count'] = Variable<int>(taskCount.value);
    }
    if (mustAlert.present) {
      map['must_alert'] = Variable<bool>(mustAlert.value);
    }
    if (alertDue.present) {
      map['alert_due'] = Variable<DateTime>(alertDue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('progress: $progress, ')
          ..write('taskCount: $taskCount, ')
          ..write('mustAlert: $mustAlert, ')
          ..write('alertDue: $alertDue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final TodoDao todoDao = TodoDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoItems];
}

typedef $$TodoItemsTableCreateCompanionBuilder =
    TodoItemsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      Value<int?> progress,
      Value<int?> taskCount,
      Value<bool?> mustAlert,
      Value<DateTime?> alertDue,
      Value<DateTime?> createdAt,
    });
typedef $$TodoItemsTableUpdateCompanionBuilder =
    TodoItemsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<int?> progress,
      Value<int?> taskCount,
      Value<bool?> mustAlert,
      Value<DateTime?> alertDue,
      Value<DateTime?> createdAt,
    });

class $$TodoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taskCount => $composableBuilder(
    column: $table.taskCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mustAlert => $composableBuilder(
    column: $table.mustAlert,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get alertDue => $composableBuilder(
    column: $table.alertDue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taskCount => $composableBuilder(
    column: $table.taskCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mustAlert => $composableBuilder(
    column: $table.mustAlert,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get alertDue => $composableBuilder(
    column: $table.alertDue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get taskCount =>
      $composableBuilder(column: $table.taskCount, builder: (column) => column);

  GeneratedColumn<bool> get mustAlert =>
      $composableBuilder(column: $table.mustAlert, builder: (column) => column);

  GeneratedColumn<DateTime> get alertDue =>
      $composableBuilder(column: $table.alertDue, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TodoItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodoItemsTable,
          TodoItem,
          $$TodoItemsTableFilterComposer,
          $$TodoItemsTableOrderingComposer,
          $$TodoItemsTableAnnotationComposer,
          $$TodoItemsTableCreateCompanionBuilder,
          $$TodoItemsTableUpdateCompanionBuilder,
          (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
          TodoItem,
          PrefetchHooks Function()
        > {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int?> progress = const Value.absent(),
                Value<int?> taskCount = const Value.absent(),
                Value<bool?> mustAlert = const Value.absent(),
                Value<DateTime?> alertDue = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => TodoItemsCompanion(
                id: id,
                title: title,
                description: description,
                progress: progress,
                taskCount: taskCount,
                mustAlert: mustAlert,
                alertDue: alertDue,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                Value<int?> progress = const Value.absent(),
                Value<int?> taskCount = const Value.absent(),
                Value<bool?> mustAlert = const Value.absent(),
                Value<DateTime?> alertDue = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => TodoItemsCompanion.insert(
                id: id,
                title: title,
                description: description,
                progress: progress,
                taskCount: taskCount,
                mustAlert: mustAlert,
                alertDue: alertDue,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodoItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodoItemsTable,
      TodoItem,
      $$TodoItemsTableFilterComposer,
      $$TodoItemsTableOrderingComposer,
      $$TodoItemsTableAnnotationComposer,
      $$TodoItemsTableCreateCompanionBuilder,
      $$TodoItemsTableUpdateCompanionBuilder,
      (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
      TodoItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
}
