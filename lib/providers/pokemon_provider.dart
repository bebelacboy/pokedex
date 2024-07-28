import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/providers/pokemon_queries.dart';

class PokemonProvider with ChangeNotifier {
  final GraphQLClient client;

  List<Pokemon> _pokemons = [];
  Pokemon? _pokemon;
  bool _isLoading = true;
  bool _isListLoading = true;

  List<Pokemon> get pokemons => _pokemons;
  Pokemon? get pokemon => _pokemon;
  bool get isLoading => _isLoading;
  bool get isListLoading => _isListLoading;

  PokemonProvider({required this.client});

  void fetchPokemons() async {
    final QueryOptions options =
        QueryOptions(document: gql(fetchPokemonsQuery));

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      final List<dynamic> data = result.data?['pokemons'];
      _pokemons =
          data.map((pokemonJson) => Pokemon.fromJson(pokemonJson)).toList();
    } else {
      print(result.exception.toString());
    }
    _isListLoading = false;
    notifyListeners();
  }

  void fetchPokemon(String id) async {
    _isLoading = true;
    _pokemon = null;
    notifyListeners();
    final QueryOptions queryOptions =
        QueryOptions(document: gql(fetchPokemonQuery), variables: {'id': id});
    final QueryResult result = await client.query(queryOptions);

    if (!result.hasException) {
      _pokemon = Pokemon.fromJson(result.data?['pokemon']);
      _isLoading = false;
      notifyListeners();
    } else {
      print(result.exception.toString());
    }
  }
}
