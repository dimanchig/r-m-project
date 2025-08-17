import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:game_project/feature/data/models/character_model.dart';

abstract class CharacterFromApiDataInterface {
  Future<List<CharacterModel>> getAllCharacters(int page);
  Future<List<CharacterModel>> searchCharacter(String query);
}

class CharacterAPIData implements CharacterFromApiDataInterface {
  CharacterAPIData({required this.client});

  final http.Client client;

  @override
  Future<List<CharacterModel>> getAllCharacters(int page) async {
    return await _getCharacterFromUrl(
      'https://rickandmortyapi.com/api/character/?page=$page',
    );
  }

  @override
  Future<List<CharacterModel>> searchCharacter(String query) async {
    return await _getCharacterFromUrl(
      'https://rickandmortyapi.com/api/character/?name=$query',
    );
  }

  Future<List<CharacterModel>> _getCharacterFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => CharacterModel.fromJson(person))
          .toList();
    } else {
      throw Exception(
        'Failed to load characters, status code: ${response.statusCode}',
      );
    }
  }
}
