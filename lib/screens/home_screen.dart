import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/screens/pokemon_detail_screen.dart';
import 'package:pokedex/widgets/pokemon_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pick your Pokemon!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<PokemonProvider>(
          builder: (context, provider, child) {
            if (provider.isListLoading) {
              provider.fetchPokemons();
              return Center(child: CircularProgressIndicator());
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
            return Text("No Pokemon");
          },
        ));
  }
}
