import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:manabie_code_challenge/blocs/app_bloc_delegate.dart';
import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/views/home_view.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manabie Code Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
