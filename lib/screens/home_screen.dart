import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_project/bloc/character/bloc/character_bloc.dart';
import 'package:game_project/feature/data/models/character_model.dart';
import 'package:game_project/widgets/character_card.dart';
import 'package:game_project/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick&Morty Game')),
      body: Column(
        children: [
          CharacterSearchField(
            onChanged: (value) => setState(() => searchQuery = value),
          ),
          Expanded(
            child: BlocBuilder<CharactersBloc, CharactersState>(
              builder: (context, state) {
                List<CharacterModel> characters = [];

                if (state is CharactersLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CharactersLoaded) {
                  characters = state.characters;
                } else {
                  print('Сейчас стейт: $state');
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 элемента в ряд
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return CharacterCard(character: characters[index]);
                  },

                  itemCount: characters.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
