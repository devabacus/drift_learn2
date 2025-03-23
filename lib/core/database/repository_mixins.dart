mixin CrudRepository<T> {
  Future<List<T>> getAll();
  Future<T> getById(int id);
  Future<int> add(T item);
  Future<bool> update(T item);
  Future<int> delete(int id);
}

// Дополнительные возможности как отдельные миксины
mixin WatchableRepository<T> {
  Stream<List<T>> watchAll();
}

mixin CountableRepository<T> {
  Future<int> count();
  Future<bool> exists(int id);
}

mixin FilterableRepository<T> {
  Future<List<T>> getWhere(bool Function(T) predicate);
  Future<int> deleteWhere(bool Function(T) predicate);
}