import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_evolution_model.dart';

class EvolutionTab extends StatelessWidget {
  final List<PokemonEvolution>? evolutions;
  final String? evolutionRequirementName;
  final int? evolutionRequirementAmount;

  const EvolutionTab({super.key, this.evolutions, this.evolutionRequirementName, this.evolutionRequirementAmount});

  @override
  Widget build(BuildContext context) {
    if (evolutions == null) {
      return Container(
        margin: const EdgeInsets.all(40),
        child: const Text(
          'No pokemon evolution',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
    }
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(children: <Widget>[
          Text("$evolutionRequirementAmount $evolutionRequirementName to evolve",textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
          const SizedBox(height: 20,),
       Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 15,
          children: evolutions!.map((evolution) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  evolution.image,
                  width: 130.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  evolution.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            );
          }).toList(),
        )
        ],
        ) 
        );
  }
}
