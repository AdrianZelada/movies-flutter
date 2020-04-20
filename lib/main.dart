import 'package:flutter/material.dart';
import 'package:movies_app/routes/routes_provider.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: '/',
      routes: getRoutes()
    );
  }
}