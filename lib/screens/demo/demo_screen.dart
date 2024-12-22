import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'models/todo_model.dart';
import 'models/todo_response.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  /// Danh sách công việc
  late Future<List<TodoModel>?> todos;

  @override
  void initState() {
    super.initState();

    /// Gán danh sách công việc bằng hàm getTodos
    todos = getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Screen'),
      ),

      /// FutureBuilder là một widget giúp xây dựng UI dựa trên dữ liệu từ một Future
      body: FutureBuilder<List<TodoModel>?>(
        future: todos,

        /// Hàm xử lý dữ liệu nhận được
        builder: (context, snapshot) {
          /// Kiểm tra xem dữ liệu nhận được có không
          if (snapshot.hasData) {
            /// Lấy danh sách công việc từ dữ liệu nhận được
            final todos = snapshot.data!;
            /// Hiển thị danh sách công việc
            return ListView.builder(
              /// ItemBuilder để xây dựng mỗi item trong ListView
              itemBuilder: (context, index) {
                /// Lấy công việc từ danh sách công việc
                final todo = todos[index];
                /// Hiển thị công việc
                return ListTile(
                  /// Tiêu đề của công việc
                  title: Text(todo.todo),
                  /// Phụ đề của công việc
                  subtitle: Text('Completed: ${todo.completed}'),
                );
              },
              /// Số lượng item trong ListView
              itemCount: snapshot.data!.length,
            );

            /// Kiểm tra xem có lỗi không
          } else if (snapshot.hasError) {
            /// Hiển thị lỗi nếu có
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            /// Hiển thị CircularProgressIndicator nếu chưa có dữ liệu
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  /// Hàm lấy danh sách công việc
  Future<List<TodoModel>?> getTodos() async {
    /// Tạo một Uri từ một chuỗi
    final url = Uri.parse('https://dummyjson.com/todos');

    /// Gửi một yêu cầu GET đến url
    final response = await http.get(url);

    /// Kiểm tra xem yêu cầu có thành công không
    if (response.statusCode == 200) {
      /// Decode dữ liệu nhận được từ server
      final data = jsonDecode(response.body);

      /// Tạo một đối tượng TodoResponse từ dữ liệu nhận được
      final todoResponse = TodoResponse.fromJson(data);
      final todos = todoResponse.todos;

      /// Trả về danh sách công việc
      return todos;
    } else {
      /// In ra lỗi nếu có
      debugPrint('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
