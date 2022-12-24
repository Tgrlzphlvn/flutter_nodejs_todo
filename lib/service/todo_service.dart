import 'package:dio/dio.dart';
import 'package:nodejs_flutter_todo_app/model/todo.dart';

class TodoService {
  final Dio _dio = Dio();

  Future<List<Data>?> getAllTodos(int pageNumber) async {
    final request =
        await _dio.get('http://localhost:3000/api/todo?page=${pageNumber}');

    if (request.statusCode == 200) {
      final result = request.data;
      if (result is Map<String, dynamic>) {
        return TodoData.fromJson(result).data;
      }
    } else {
      return [];
    }
  }

  Future<void> addTodo(Data data) async {
    await _dio.post(
      'http://localhost:3000/api/todo',
      data: data.toJson(),
    );
  }

  Future<void> deleteTodo(Data data) async {
    await _dio.delete(
      'http://localhost:3000/api/todo/${data.sId}',
    );
  }

  Future<void> updateTodo(Data data) async {
    await _dio.put(
      'http://localhost:3000/api/todo/${data.sId}',
      data: data,
    );
  }
}
