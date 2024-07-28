class PokemonAttack {
  final String name;
  final String type;
  final int damage;

  PokemonAttack(
      {required this.name,
      required this.type,
      required this.damage
      });

  factory PokemonAttack.fromJson(Map<String, dynamic> json) {
    return PokemonAttack(
        name: json['name'],
        type: json['type'],
        damage: json['damage'] as int,        
        );

  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'damage': damage
    };
  }
}
