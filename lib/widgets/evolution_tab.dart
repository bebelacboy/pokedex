import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_evolution_model.dart';

class EvolutionTab extends StatelessWidget {
  final List<PokemonEvolution>? evolutions;

  const EvolutionTab({super.key, this.evolutions});

  @override
  Widget build(BuildContext context) {
    if (evolutions == null) {
      return Container(
        margin: EdgeInsets.all(40),
        child: Text(
          'No pokemon evolution',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
    }
    return Container(
        margin: EdgeInsets.all(40),
        child: Wrap(
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
                SizedBox(height: 8),
                Text(
                  evolution.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            );
          }).toList(),
        ));
  }
}
