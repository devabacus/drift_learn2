import 'package:drift_learn2/core/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database_provider.g.dart';


@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}
