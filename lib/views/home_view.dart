import 'package:flutter/material.dart';
import 'package:nodejs_flutter_todo_app/model/todo.dart';
import 'package:nodejs_flutter_todo_app/viewmodel/todo_view_model.dart';
import 'package:nodejs_flutter_todo_app/views/add_todo_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nodejs & Flutter Todo'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                child: const Icon(Icons.get_app_outlined),
                onPressed: () {
                  Provider.of<TodoViewModel>(context, listen: false).addPageNum();
                  Provider.of<TodoViewModel>(context, listen: false).getTodos(
                      Provider.of<TodoViewModel>(context, listen: false).pageNum);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: const Text('Add'),
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddTodoView(
                      isUpdate: false,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: _todoList(context),
    );
  }

  Widget _todoList(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TodoViewModel>(context).todos.length,
      itemBuilder: (context, index) {
        Data todo = Provider.of<TodoViewModel>(context, listen: false).todos[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(todo.name ?? ''),
                Text(todo.descripiton ?? ''),
                IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    Provider.of<TodoViewModel>(context, listen: false)
                        .deleteTodo(todo);
                    Provider.of<TodoViewModel>(context, listen: false).getTodos(1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.upgrade),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddTodoView(
                          isUpdate: true,
                          todo: todo,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
