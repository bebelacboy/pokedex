import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_type_color_mapping.dart';
import 'package:pokedex/constants/pokemon_type_icon_mapping.dart';

class PokemonTypeTag extends StatelessWidget {
  final String type;

  const PokemonTypeTag({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: pokemonTypeToColor[type],
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 0),
            )
          ]),
      child: Row(children: [
        Icon(
          pokemonTypeToIcon[type],
          color: Colors.white,
          size: 15,
        ),
        SizedBox(width: 3),
        Text(type, style: TextStyle(color: Colors.white, fontSize: 15))
      ]),
    );
  }
}
