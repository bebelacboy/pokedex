const String fetchPokemonsQuery = r'''
  query {
    pokemons(first: 200) {
      id
      number
      name
      types
      image
    }
  }
''';

String fetchPokemonQuery = r'''
    query getPokemon($id: String) {
      pokemon(id: $id) {
        id
        number
        name
        types
        weight {
          minimum
          maximum
        }
        height {
          minimum
          maximum
        }
        classification
        resistant
        attacks {
          fast {
            name
            type
            damage
          }
          special {
            name
            type
            damage
          }
        }
        fleeRate
        weaknesses
        evolutions {
          name
          image
        }
        maxHP
        image
      }
    }
  ''';

