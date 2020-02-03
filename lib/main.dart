import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_bloc_sample/bloc/user_bloc.dart';
import 'package:mvvm_bloc_sample/ui/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => UserBloc(),
        child: MainPage(),
      ),

    );
  }
}