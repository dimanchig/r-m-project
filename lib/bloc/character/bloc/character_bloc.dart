import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_project/repositories/character_repository.dart';
import 'package:meta/meta.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({required CharacterRepository repository})
    : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
