import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift_learn2/features/todo/data/datasources/local/todo_items_table.dart';
import 'package:path_provider/path_provider.dart';


part 'database.g.dart';

@DriftDatabase(tables: [TodoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? excutor]) : super(excutor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
    );
  }
}
