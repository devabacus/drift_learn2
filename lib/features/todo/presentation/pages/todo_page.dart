import 'package:drift_learn2/features/todo/data/repositories/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/todo_navigation_provider.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> insertInDB() async {
    final todoRepo = ref.read(todoRepositoryProvider);
    todoRepo.addTodo('тест заголово', 'тест описания');
  }

  Future<void> readFromDB() async {
    final todoRepo = ref.read(todoRepositoryProvider);
    final todos = await todoRepo.getAll();
    print('items in database: $todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TodoPage"),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () => insertInDB(), child: Text("save")),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () => readFromDB(), child: Text("read")),
          ],
        ),
      ),
    );
  }
}
