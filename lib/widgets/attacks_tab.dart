import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_attack_model.dart';
import 'package:pokedex/widgets/attack_card.dart';

class AttacksTab extends StatelessWidget {
  final List<PokemonAttack> fastAttacks;
  final List<PokemonAttack> specialAttacks;

  const AttacksTab(
      {super.key, required this.fastAttacks, required this.specialAttacks});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Fast Attacks",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              runSpacing: 15,
              children: fastAttacks.map((attack) {
                return AttackCard(
                    name: attack.name,
                    type: attack.type,
                    damage: attack.damage);
              }).toList(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Special Attacks",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 15,
                children: specialAttacks.map((attack) {
                  return AttackCard(
                      name: attack.name,
                      type: attack.type,
                      damage: attack.damage);
                }).toList()),
          ],
        ));
  }
}
