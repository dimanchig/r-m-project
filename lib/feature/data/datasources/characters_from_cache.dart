import 'package:game_project/feature/data/models/character_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CharactersFromCacheInterface {
  Future<List<CharacterModel>> getCharactersFromCache();
  Future<void> charactersToCache(List<CharacterModel> characters);
}

class CharactersFromCache implements CharactersFromCacheInterface {
  final Box<CharacterModel> box = Hive.box<CharacterModel>('characters');

  @override
  Future<void> charactersToCache(List<CharacterModel> characters) async {
    for (var character in characters) {
      box.put(character.id, character);
    }
  }

  @override
  Future<List<CharacterModel>> getCharactersFromCache() async {
    return box.values.toList();
  }

  void saveCharacter(CharacterModel character) {
    box.put(character.id, character);
  }
}
