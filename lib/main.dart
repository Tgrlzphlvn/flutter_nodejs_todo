import 'package:flutter/material.dart';
import 'package:nodejs_flutter_todo_app/viewmodel/todo_view_model.dart';
import 'package:nodejs_flutter_todo_app/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TodoViewModel>(
      create: (context) => TodoViewModel()..getTodos(1),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter & Nodejs & Mongodb',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
