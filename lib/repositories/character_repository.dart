import 'package:dio/dio.dart';
import 'package:game_project/models/character.dart';

class CharacterRepository {
  final Dio _dio;

  CharacterRepository({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://rickandmortyapi.com/api',
              connectTimeout: const Duration(seconds: 5),
              receiveTimeout: const Duration(seconds: 5),
            ),
          );

  Future<List<Character>> getCharacters() async {
    final response = await _dio.get('/character');
    if (response.statusCode == 200) {
      final data = response.data;
      print(data);
      return (data['results'] as List)
          .map((json) => Character.fromJson(json))
          .toList();
    } else {
      throw Exception('Ошибка загрузки персонажей');
    }
  }
}
