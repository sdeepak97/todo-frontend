import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todolistflutternodejs/core/notifiers/todo_notifier.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => TodoNotifier())
];
