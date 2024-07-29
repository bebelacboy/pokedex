import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_type_color_mapping.dart';
import 'package:pokedex/widgets/pokemon_type_tag.dart';

class PokemonListItem extends StatelessWidget {
  final String id;
  final String number;
  final String name;
  final List<String> types;
  final String image;
  final VoidCallback? onTap;

  const PokemonListItem(
      {super.key,
      required this.id,
      required this.number,
      required this.name,
      required this.types,
      required this.image,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 10.0),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
              color: pokemonTypeToColor[types[0]],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    child: Image.network(
                      image,
                      width: 90.0,
                      height: 130.0,
                      fit: BoxFit.cover,
                    ),
                  )),
              const Expanded(
                flex: 1,
                child: SizedBox(width: 33),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Text(
                      "#${number}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.5,
                          color: Colors.black45),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                        children: types
                            .map((type) => PokemonTypeTag(type: type))
                            .toList()),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
