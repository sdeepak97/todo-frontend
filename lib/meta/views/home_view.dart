import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistflutternodejs/app/routes/routes.dart';
import 'package:todolistflutternodejs/core/notifiers/todo_notifier.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Todo view")),
      body: Container(
        child: Consumer<TodoNotifier>(
          builder: (context, notifier, _) {
            return FutureBuilder(
                future: notifier.readTodos(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: notifier.todos.length,
                      itemBuilder: (context, index) => ListTile(
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(Updateroute,
                                              arguments: notifier.todos[index]
                                                  ['id']);
                                      // await notifier.updateTodos(
                                      //     id: notifier.todos[index]['id'],
                                      //     title: notifier.todos[index]['title'],
                                      //     description: notifier.todos[index]
                                      //         ['decription']);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      notifier.deleteTodos(
                                          id: notifier.todos[index]['id']);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle:
                                Text(notifier.todos[index]['description']),
                            title: Text(notifier.todos[index]['title']),
                          ));
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddTodoRoute);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
