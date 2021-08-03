import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todolistflutternodejs/core/api/todo.api.dart';

class TodoNotifier extends ChangeNotifier {
  final TodoAPI _todoAPI = new TodoAPI();

  List _todos = [];
  List get todos => _todos;

  Future readTodos() async {
    try {
      await _todoAPI.readTodos().then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        var listOfTodos = parsedData['data'];
        _todos = listOfTodos;

        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }

  Future addTodos({required String title, required String description}) async {
    try {
      await _todoAPI
          .addTodo(title: title, description: description)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());

        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }

  Future updateTodos(
      {required dynamic id,
      required String title,
      required String description}) async {
    try {
      await _todoAPI
          .updateTodo(id: id, title: title, description: description)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }

  Future deleteTodos({required dynamic id}) async {
    try {
      await _todoAPI.deleteTodo(id: id).then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        print("1st parsed data");
        print(parsedData['data']);
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }
}
