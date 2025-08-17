import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_project/feature/data/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: character.status == 'Alive'
              ? const Color.fromARGB(255, 97, 117, 97)
              : const Color.fromARGB(255, 160, 102, 97),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100), // кружочек
              child: CachedNetworkImage(
                imageUrl: character.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 40, color: Colors.red),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: character.status == 'Alive'
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  children: [
                    Text(
                      '${character.origin.name}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${character.location.name}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
