import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_project/bloc/character/bloc/character_bloc.dart';
import 'package:game_project/feature/data/datasources/characters_from_API.dart';
import 'package:game_project/feature/data/datasources/characters_from_cache.dart';
import 'package:game_project/feature/data/models/character_locationAndOrigin_model.dart';
import 'package:game_project/feature/data/models/character_model.dart';
import 'package:game_project/feature/data/repositories/character_repository.dart';
import 'package:game_project/screens/home_screen.dart';
import 'package:game_project/screens/themes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterModelAdapter());
  Hive.registerAdapter(LocationAndOriginModelAdapter());
  await Hive.deleteBoxFromDisk('characters');
  await Hive.openBox<CharacterModel>('characters');

  final charactersRepository = CharacterRepository(
    charactersFromAPI: CharacterAPIData(client: http.Client()),
    charactersFromCache: CharactersFromCache(),
  );

  runApp(
    BlocProvider(
      create: (context) =>
          CharactersBloc(charactersRepository: charactersRepository)
            ..add(LoadCharacters()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), theme: darkTheme);
  }
}
