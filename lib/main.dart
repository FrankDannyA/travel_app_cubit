import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit_logic.dart';
import 'package:travel_app_cubit/cubit/app_cubit_states.dart';
import 'package:travel_app_cubit/pages/detail_page.dart';
import 'package:travel_app_cubit/pages/nav_pages/main_page.dart';
import 'package:travel_app_cubit/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(),
        child: AppCubitLogic(),
      ),
    );
  }
}
