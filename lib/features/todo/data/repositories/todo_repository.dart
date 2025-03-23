
import 'package:drift_learn2/core/database/database.dart';
import 'package:drift_learn2/core/database/repository_mixins.dart';

class TodoRepository with CrudRepository<TodoItem> {
  final AppDatabase _db;
  
  TodoRepository(this._db);
  
// Специализированный метод для создания новой задачи
Future<int> addTodo(String title, String content) {
  return _db.into(_db.todoItems).insert(
    TodoItemsCompanion.insert(
      title: title, 
      content: content,
    ),
  );
}

// Реализация метода из миксина
@override
Future<int> add(TodoItem item) {
  return _db.into(_db.todoItems).insert(item.toCompanion(false));
}
  
  @override
  Future<int> delete(int id) {
    return (_db.delete(_db.todoItems)..where((t)=>t.id.equals(id))).go();

  }
  
  @override
  Future<List<TodoItem>> getAll() {
    return _db.select(_db.todoItems).get();
  }
  
  @override
  Future<TodoItem> getById(int id) {
    return (_db.select(_db.todoItems)..where((t) => t.id.equals(id))).getSingle();

  }
  
  @override
  Future<bool> update(TodoItem item) {
    return _db.update(_db.todoItems).replace(item);
  }
}


