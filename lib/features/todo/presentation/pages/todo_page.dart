
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/todo_navigation_provider.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final todoNavService = ref.read(todoNavigationServiceProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TodoPage"),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => {},
              child: Text("ButtonText"),
            ),
          ],
        ),
      ),
    );
  }
}

