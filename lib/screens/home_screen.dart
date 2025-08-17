import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_project/bloc/character/bloc/character_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          // Ловим состояние и выводим в консоль
          if (state is CharactersLoaded) {
            for (var c in state.characters) {
              print('${c.id} - ${c.name}');
            }
          }

          return Center(
            child: FloatingActionButton(
              onPressed: () {
                // Вызываем эвент блока
                context.read<CharactersBloc>().add(LoadCharacters());
              },
              child: const Icon(Icons.download),
            ),
          );
        },
      ),
    );
  }
}
