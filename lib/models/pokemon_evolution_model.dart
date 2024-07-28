class PokemonEvolution {
  final String name;
  final String image;

  PokemonEvolution({required this.name, required this.image});

  factory PokemonEvolution.fromJson(Map<String, dynamic> json) {
    return PokemonEvolution(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
