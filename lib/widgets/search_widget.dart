import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharacterSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CharacterSearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          hintText: 'Поиск персонажа...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
