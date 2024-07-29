import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_type_color_mapping.dart';
import 'package:pokedex/constants/pokemon_type_icon_mapping.dart';

class PokemonTypeTag extends StatelessWidget {
  final String type;
  final VoidCallback? onTap;

  const PokemonTypeTag({super.key, required this.type, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: pokemonTypeToColor[type],
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
    
            )
          ]),
      child: Row(children: [
        Icon(
          pokemonTypeToIcon[type],
          color: Colors.white,
          size: 15,
        ),
        const SizedBox(width: 3),
        Text(type, style: const TextStyle(color: Colors.white, fontSize: 15))
      ]),
    )
    );

    
  }
}
