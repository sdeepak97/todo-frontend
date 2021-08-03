import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistflutternodejs/app/routes/routes.dart';
import 'package:todolistflutternodejs/core/notifiers/todo_notifier.dart';

class UpdateTodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    var todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Update View")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter title"),
                    controller: titleController,
                  )),
              SizedBox(height: 20),
              Container(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter description"),
                    controller: descriptionController,
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty) {
                      todoNotifier
                          .updateTodos(
                              id: id,
                              title: titleController.text,
                              description: descriptionController.text)
                          .whenComplete(() {
                        Navigator.of(context).pushReplacementNamed(HomeRoute);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Fill the details")));
                    }
                  },
                  child: Text("update todo"))
            ],
          ),
        ),
      ),
    );
  }
}
