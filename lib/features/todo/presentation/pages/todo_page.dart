import 'package:drift_learn2/core/database/database.dart';
import 'package:drift_learn2/core/database/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/todo_navigation_provider.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  late AppDatabase database;

  @override
  void initState() {
    super.initState();
  }     

  Future<void> insertInDB() async {
    await database
        .into(database.todoItems)
        .insert(
          TodoItemsCompanion.insert(title: 'запись1', content: 'описание 1'),
        );
  }

  Future<void> readFromDB() async {
    final allItems = await database.select(database.todoItems).get();
    
    print('items in database: $allItems');
  }

  @override
  Widget build(BuildContext context) {
    database = ref.read(appDatabaseProvider);

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
