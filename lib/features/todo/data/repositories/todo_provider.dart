import 'package:drift_learn2/core/database/database_provider.dart';
import 'package:drift_learn2/features/todo/data/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'todo_provider.g.dart';

@riverpod
TodoRepository todoRepository(Ref ref) {
  final database = ref.read(appDatabaseProvider);
  return TodoRepository(database);
}