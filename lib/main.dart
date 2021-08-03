import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistflutternodejs/app/providers/providers.dart';
import 'package:todolistflutternodejs/app/routes/routes.dart';

void main() {
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
