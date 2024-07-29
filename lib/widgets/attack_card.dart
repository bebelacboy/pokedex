import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_type_color_mapping.dart';
import 'package:pokedex/widgets/pokemon_type_tag.dart';

class AttackCard extends StatelessWidget {
  final String name;
  final String type;
  final int damage;
  const AttackCard(
      {super.key,
      required this.name,
      required this.type,
      required this.damage});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        decoration: BoxDecoration(color: pokemonTypeToColor[type], borderRadius: BorderRadius.circular(12), boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )]
              ),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                name,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              PokemonTypeTag(type: type)
            ]),
            Column(children: <Widget>[
              const Text("Damage", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              const SizedBox(height: 8,),
              Text("$damage", style: const TextStyle(color: Colors.white),)
            ],)
          ],
        ));
  }
}
