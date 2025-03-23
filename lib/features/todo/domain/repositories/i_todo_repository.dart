import '../entities/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getAll();
  Future<Todo> getById(int id);
  Future<int> add(Todo item);
  Future<bool> update(Todo item);
  Future<int> delete(int id);
}