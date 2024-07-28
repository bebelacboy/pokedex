import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_type_tag.dart';

class AboutTab extends StatelessWidget {
  final int maxHp;
  final double minWeight;
  final double maxWeight;
  final double minHeight;
  final double maxHeight;
  final double fleeRate;
  final String classification;
  final List<String> resistant;
  final List<String> weaknesses;

  const AboutTab(
      {super.key,
      required this.maxHp,
      required this.minWeight,
      required this.maxWeight,
      required this.minHeight,
      required this.maxHeight,
      required this.fleeRate,
      required this.classification,
      required this.resistant,
      required this.weaknesses});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Height",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 8,),
                          Text("Weight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 8,),
                          Text("Max HP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 8,),
                          Text("Flee Rate",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 8,),
                          Text("Classification",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 8,),
                        ])),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            "${((minHeight + maxHeight) / 2).toStringAsFixed(2)} m",
                            style: TextStyle(color: Colors.black)),
                          SizedBox(height: 8,),
                        Text(
                            "${((minHeight + maxWeight) / 2).toStringAsFixed(2)} kg",
                            style: TextStyle(color: Colors.black)),
                          SizedBox(height: 8,),
                        Text("$maxHp", style: TextStyle(color: Colors.black)),
                          SizedBox(height: 8,),
                        Text("${fleeRate.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.black)),
                          SizedBox(height: 8,),
                        Text("$classification",
                            style: TextStyle(color: Colors.black)),
                          SizedBox(height: 8,),
                      ],
                    )),
              ],
            ),
            Text("Resistant",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
                    SizedBox(height: 8),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: resistant
                    .map((type) => Container(
                        width: 100, child: PokemonTypeTag(type: type)))
                    .toList()),
                    SizedBox(height: 8),
            Text("Weaknesses",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
                    SizedBox(height: 8),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: weaknesses
                    .map((type) => Container(width: 100, child: PokemonTypeTag(type: type)))
                    .toList(),
          )],
        ));
  }
}
