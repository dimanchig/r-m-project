import 'package:game_project/feature/data/datasources/characters_from_API.dart';
import 'package:game_project/feature/data/datasources/characters_from_cache.dart';
import 'package:game_project/feature/data/models/character_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CharacterRepository {
  final CharacterFromApiDataInterface charactersFromAPI;
  final CharactersFromCacheInterface charactersFromCache;

  CharacterRepository({
    required this.charactersFromAPI,
    required this.charactersFromCache,
  });

  Future<List<CharacterModel>> getAllCharacters(int page) async {
    return await _getCharacters(() {
      return charactersFromAPI.getAllCharacters(page);
    });
  }

  Future<List<CharacterModel>> searchCharacter(String query) async {
    return await _getCharacters(() {
      return charactersFromAPI.searchCharacter(query);
    });
  }

  Future<List<CharacterModel>> _getCharacters(
    Future<List<CharacterModel>> Function() getCharacters,
  ) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      try {
        final apiCharacters = await getCharacters();
        await charactersFromCache.charactersToCache(apiCharacters);
        return apiCharacters;
      } catch (e) {
        throw Exception('Ошибка при получении с API: $e');
      }
    } else {
      try {
        final cacheCharacters = await charactersFromCache
            .getCharactersFromCache();
        return cacheCharacters;
      } catch (e) {
        throw Exception('Ошибка при получении из кэша: $e');
      }
    }
  }
}
