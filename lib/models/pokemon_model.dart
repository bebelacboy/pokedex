import 'package:pokedex/models/pokemon_attack_model.dart';
import 'package:pokedex/models/pokemon_evolution_model.dart';

class Pokemon {
  final String id;
  final String number;
  final String name;
  final List<String> types;
  final String image;
  final int? maxHp;
  final double? minWeight;
  final double? maxWeight;
  final double? minHeight;
  final double? maxHeight;
  final double? fleeRate;
  final String? classification;
  final List<String>? resistant;
  final List<String>? weaknesses;
  final List<PokemonAttack>? fastAttacks;
  final List<PokemonAttack>? specialAttacks;
  final List<PokemonEvolution>? evolutions;

  Pokemon(
      {required this.id,
      required this.number,
      required this.name,
      required this.types,
      required this.image,
      this.maxHp,
      this.minHeight,
      this.maxHeight,
      this.minWeight,
      this.maxWeight,
      this.classification,
      this.fleeRate,
      this.resistant,
      this.weaknesses,
      this.fastAttacks,
      this.specialAttacks,
      this.evolutions});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        number: json['number'],
        name: json['name'],
        types: List<String>.from(json['types']),
        image: json['image'],
        maxHp: json['maxHP'] as int?,
        minHeight: json['height'] != null
            ? double.parse(Map<String, String>.from(json['height'])['minimum']
                ?.replaceAll(RegExp(r'[^0-9.]'), '') as String)
            : null,
        maxHeight: json['height'] != null
            ? double.parse(Map<String, String>.from(json['height'])['maximum']
                ?.replaceAll(RegExp(r'[^0-9.]'), '') as String)
            : null,
        minWeight: json['weight'] != null
            ? double.parse(Map<String, String>.from(json['weight'])['minimum']
                ?.replaceAll(RegExp(r'[^0-9.]'), '') as String)
            : null,
        maxWeight: json['weight'] != null
            ? double.parse(Map<String, String>.from(json['weight'])['maximum']?.replaceAll(RegExp(r'[^0-9.]'), '') as String)
            : null,
        classification: json['classification'],
        fleeRate: json['fleeRate'] as double?,
        weaknesses: json['weaknesses'] != null ? List<String>.from(json['weaknesses']) : null,
        resistant: json['resistant'] != null ? List<String>.from(json['resistant']) : null,
        fastAttacks: json['attacks'] != null
            ? List<dynamic>.from(Map<String, dynamic>.from(json['attacks'])['fast']).map((attack) {
                return PokemonAttack.fromJson(attack);
              }).toList()
            : null,
        specialAttacks: json['attacks'] != null
            ? List<dynamic>.from(Map<String, dynamic>.from(json['attacks'])['special']).map((attack) {
                return PokemonAttack.fromJson(attack);
              }).toList()
            : null,
            evolutions: json['evolutions'] != null ? List<dynamic>.from(json['evolutions']).map((evolution) {
              return PokemonEvolution.fromJson(evolution);
            }).toList() : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'types': types,
      'image': image,
      'maxHp': maxHp,
      'fleeRate': fleeRate,
      'classification': classification,
      'minHeight': minHeight,
      'maxHeight': maxHeight,
      'minWeight': minWeight,
      'maxWeight': maxWeight,
      'weaknesses': weaknesses,
      'resistant': resistant,
      'fastAttacks': fastAttacks,
      'specialAttacks': specialAttacks,
      'evolutions': evolutions
    };
  }
}
