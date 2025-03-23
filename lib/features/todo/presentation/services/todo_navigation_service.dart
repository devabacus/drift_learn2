
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/todo_routes_constants.dart';


class TodoNavigationService {
  
  void navigateToTodo(BuildContext context){
      context.goNamed(TodoRoutes.todo);
  }

}

