
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String title,
    required String content,
    required DateTime? createdAt
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}





// class Todo {
//   final int id;
//   final String title;
//   final String content;
//   final DateTime? createdAt;
  
//   Todo({required this.id, required this.title, required this.content, this.createdAt});
// }