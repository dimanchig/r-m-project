import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_project/bloc/character/bloc/character_bloc.dart';
import 'package:game_project/repositories/character_repository.dart';
import 'package:game_project/screens/home_screen.dart';

void main() {
  final characterRepository = CharacterRepository();
  runApp(
    BlocProvider(
      create: (context) => CharacterBloc(repository: characterRepository),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
