import 'package:flutter/material.dart';
import 'package:nodejs_flutter_todo_app/model/todo.dart';
import 'package:nodejs_flutter_todo_app/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({Key? key, required this.isUpdate, this.todo}) : super(key: key);

  final bool isUpdate;
  final Data? todo;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? 'Update Todo' : 'Add Todo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _descriptionController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              child: Text(isUpdate ? 'Update Todo' : 'Save Todo'),
              onPressed: () {
                if (isUpdate) {
                  Provider.of<TodoViewModel>(context, listen: false).updateTodo(
                    Data(
                      sId: todo!.sId,
                      name: _nameController.text,
                      descripiton: _descriptionController.text,
                      complated: true,
                    ),
                  );
                } else {
                  Provider.of<TodoViewModel>(context, listen: false).addTodo(
                    Data(
                      name: _nameController.text,
                      descripiton: _descriptionController.text,
                      complated: true,
                    ),
                  );
                }
                Provider.of<TodoViewModel>(context, listen: false).getTodos(1);
                Navigator.of(context).pop<bool>(true);
              },
            ),
          )
        ],
      ),
    );
  }
}
