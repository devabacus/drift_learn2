
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/todo_navigation_service.dart';

part 'todo_navigation_provider.g.dart';

@riverpod
TodoNavigationService todoNavigationService(Ref ref) {
  return TodoNavigationService();
}

