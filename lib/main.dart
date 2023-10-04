import 'package:blog_explorer/api_helper/api_helper.dart';
import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/dashboard.dart';

void main() {
  runApp(BlocProvider(create: (context) =>
      BlogBloc(apiHelper: ApiHelper()),
    child:MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:  false,
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: dashboard(),
    );
  }
}
