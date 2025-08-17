part of 'character_bloc.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  CharactersLoaded({required this.characters});

  final List<CharacterModel> characters;
}

class CharactersLoadingFailure extends CharactersState {}
