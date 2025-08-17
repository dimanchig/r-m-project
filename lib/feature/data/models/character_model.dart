import 'package:game_project/feature/data/models/character_locationAndOrigin_model.dart';
import 'package:hive/hive.dart';

part 'character_model.g.dart';

@HiveType(typeId: 1)
class CharacterModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final LocationAndOriginModel origin;

  @HiveField(7)
  final LocationAndOriginModel location;

  @HiveField(8)
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'] != null
          ? LocationAndOriginModel.fromJson(json['origin'])
          : LocationAndOriginModel(name: 'Unknown', url: ''),
      location: json['location'] != null
          ? LocationAndOriginModel.fromJson(json['location'])
          : LocationAndOriginModel(name: 'Unknown', url: ''),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'image': image,
    };
  }
}
