import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_types.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/screens/pokemon_detail_screen.dart';
import 'package:pokedex/widgets/pokemon_list_item.dart';
import 'package:pokedex/widgets/pokemon_type_tag.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: Colors.white,
            title: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/pokedex_logo.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.all(0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: pokemonTypes
                        .map((type) => PokemonTypeTag(
                              type: type,
                              onTap: () {
                                context
                                    .read<PokemonProvider>()
                                    .filterPokemonsByType(type);
                              },
                            ))
                        .toList(),
                  ),
                )
              ],
            )),
        body: Consumer<PokemonProvider>(
          builder: (context, provider, child) {
            if (provider.isListLoading) {
              provider.fetchPokemons();
              return const Center(child: CircularProgressIndicator());
            } else if (provider.pokemons.isNotEmpty) {
              return ListView.builder(
                  itemCount: provider.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = provider.pokemons[index];
                    return PokemonListItem(
                        id: pokemon.id,
                        number: pokemon.number,
                        name: pokemon.name,
                        types: pokemon.types,
                        image: pokemon.image,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PokemonDetailScreen(id: pokemon.id)));
                        });
                  });
            }
            return const Center(child: Text("No Pokemon", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),));
          },
        ));
  }
}
