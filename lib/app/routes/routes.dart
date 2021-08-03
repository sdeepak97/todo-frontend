import 'package:todolistflutternodejs/meta/views/add_todo.dart';
import 'package:todolistflutternodejs/meta/views/home_view.dart';
import 'package:todolistflutternodejs/meta/views/updatetodo.dart';

const String HomeRoute = "/";
const String AddTodoRoute = "/add";
const String Updateroute = "/update";

final routes = {
  HomeRoute: (context) => HomeView(),
  AddTodoRoute: (context) => AddTodoView(),
  Updateroute: (context) => UpdateTodoView()
};
