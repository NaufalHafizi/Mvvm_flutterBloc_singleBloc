import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_bloc_sample/bloc/user_bloc.dart';
import 'package:mvvm_bloc_sample/model/user.dart';
import 'package:mvvm_bloc_sample/ui/user_card.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Demo MVVM"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Pick Random User"),
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(random.nextInt(10) + 1);
            },
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) => (user is UninitializedUser) 
            ? Container(child: CircularProgressIndicator(),) 
            : UserCard(user)),
        ],
      ),
    );
  }
}