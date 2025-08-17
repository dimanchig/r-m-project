import 'package:hive_flutter/hive_flutter.dart';

part 'character_locationAndOrigin_model.g.dart';

@HiveType(typeId: 0)
class LocationAndOriginModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
  LocationAndOriginModel({required this.name, required this.url});

  factory LocationAndOriginModel.fromJson(Map<String, dynamic> json) {
    return LocationAndOriginModel(name: json['name'], url: json['url']);
  }
}
