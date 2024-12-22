import 'package:to_do_list/screens/demo/models/todo_model.dart';

class TodoResponse {
  TodoResponse({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      todos: List<TodoModel>.from(
        json['todos'].map((x) => TodoModel.fromJson(x)),
      ),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  final List<TodoModel> todos;
  final int total;
  final int skip;
  final int limit;

  Map<String, dynamic> toJson() {
    return {
      'todos': List<dynamic>.from(todos.map((x) => x.toJson())),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}
