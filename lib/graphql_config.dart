import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static Future<ValueNotifier<GraphQLClient>> initializeClient() async {

    final HttpLink pokemonServiceLink =
        HttpLink('https://graphql-pokemon2.vercel.app');
    
    final GraphQLCache cache = GraphQLCache();
    return ValueNotifier(GraphQLClient(link: pokemonServiceLink, cache: cache));
  }
}
