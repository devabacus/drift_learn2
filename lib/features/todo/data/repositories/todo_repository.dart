import 'package:drift/drift.dart';
import 'package:drift_learn2/core/database/database.dart';
import 'package:drift_learn2/features/todo/domain/entities/todo.dart';
import 'package:drift_learn2/features/todo/domain/repositories/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  final AppDatabase _db;
  
  TodoRepository(this._db);
  
  // Маппинг из Drift-модели в доменную модель
  Todo _mapToDomain(TodoItem item) {
    return Todo(
      id: item.id,
      title: item.title,
      content: item.content,
      createdAt: item.createdAt,
    );
  }
  
// Маппинг из доменной модели в Drift-модель
  TodoItem _mapToDrift(Todo item) {
    return TodoItem(
      id: item.id,
      title: item.title,
      content: item.content,
      createdAt: item.createdAt,
    );
  }
  
  @override
  Future<int> add(Todo item) {
    return _db.into(_db.todoItems).insert(
      TodoItemsCompanion.insert(
        title: item.title,
        content: item.content,
        createdAt: Value(item.createdAt),
      ),
    );
  }
  
  @override
  Future<int> delete(int id) {
    return (_db.delete(_db.todoItems)..where((t)=>t.id.equals(id))).go();
  }
  
  @override
  Future<List<Todo>> getAll() async {
    final driftItems = await _db.select(_db.todoItems).get();
    return driftItems.map((item) => _mapToDomain(item)).toList();
  }
  
  @override
  Future<Todo> getById(int id) async {
    final driftItem = await (_db.select(_db.todoItems)..where((t) => t.id.equals(id))).getSingle();
    return _mapToDomain(driftItem);
  }
  
  @override
  Future<bool> update(Todo item) {
    final driftItem = _mapToDrift(item);
    return _db.update(_db.todoItems).replace(driftItem);
  }

  // Специализированный метод для удобства
  Future<int> addTodo(String title, String content) {
    return add(Todo(
      id: 0, // Будет заменено автоинкрементным id в базе
      title: title,
      content: content,
      createdAt: DateTime.now(),
    ));
  }
}