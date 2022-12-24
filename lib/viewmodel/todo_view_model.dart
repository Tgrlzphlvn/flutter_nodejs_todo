import 'package:flutter/cupertino.dart';
import 'package:nodejs_flutter_todo_app/model/todo.dart';
import 'package:nodejs_flutter_todo_app/service/todo_service.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoService _todoService = TodoService();

  List<Data> todos = [];

  int pageNum = 1;

  void addPageNum() {
    pageNum += 1;
    notifyListeners();
  }

  Future<void> _update() async {
    todos = [];
    pageNum = 1;
    await getTodos(pageNum);
  }

  Future<void> getTodos(int pageNumber) async {
    todos += await _todoService.getAllTodos(pageNumber) ?? [];
    notifyListeners();
  }

  Future<void> addTodo(Data todo) async {
    await _todoService.addTodo(todo);
    await _update();
  }

  Future<void> deleteTodo(Data todo) async {
    await _todoService.deleteTodo(todo);
    await _update();
  }

  Future<void> updateTodo(Data todo) async {
    await _todoService.updateTodo(todo);
    await _update();
  }
}
