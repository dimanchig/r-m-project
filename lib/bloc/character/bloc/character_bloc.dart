import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_project/feature/data/models/character_model.dart';
import 'package:game_project/feature/data/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository charactersRepository;

  CharactersBloc({required this.charactersRepository})
    : super(CharactersInitial()) {
    on<LoadCharacters>(_load);
  }

  Future<void> _load(
    LoadCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    try {
      emit(CharactersLoading());
      final charactersList = await charactersRepository.getAllCharacters(2);
      emit(
        CharactersLoaded(characters: charactersList),
      ); // новые данные заменяют старые
    } catch (e) {
      //emit(CharactersLoadingFailure(message: e.toString()));
    }
  }
}
