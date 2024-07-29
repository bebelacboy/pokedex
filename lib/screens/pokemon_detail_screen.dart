import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_type_color_mapping.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/widgets/about_tab.dart';
import 'package:pokedex/widgets/evolution_tab.dart';
import 'package:pokedex/widgets/pokemon_type_tag.dart';
import 'package:pokedex/widgets/attacks_tab.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String id;
  const PokemonDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Consumer<PokemonProvider>(
            builder: (context, provider, child) {
              Future.microtask(() {
                provider.fetchPokemon(id);
              });
              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200,
                      floating: false,
                      foregroundColor: Colors.white,
                      backgroundColor: provider.isLoading
                          ? Colors.grey
                          : pokemonTypeToColor[provider.pokemon!.types[0]],
                      pinned: true,
                      flexibleSpace: provider.isLoading
                          ? FlexibleSpaceBar(
                              background: Container(
                                alignment: Alignment.center,
                                child: const Text("Retrieving Pokemon",
                                    style:  TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ),
                              centerTitle: true,
                            )
                          : FlexibleSpaceBar(
                              background: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.network(
                                              provider.pokemon!.image,
                                              width: 90,
                                              fit: BoxFit.contain,
                                            )),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "#${provider.pokemon!.number}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.5,
                                                  color: Colors.black45),
                                            ),
                                            Text(
                                              provider.pokemon!.name,
                                              style: const TextStyle(
                                                  fontSize: 25.0,
                                                  letterSpacing: 2,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                                children: provider
                                                    .pokemon!.types
                                                    .map((type) =>
                                                        PokemonTypeTag(
                                                            type: type))
                                                    .toList()),
                                            const SizedBox(height: 10),
                                          ],
                                        )
                                      ]))),
                      bottom: const TabBar(
                          indicatorColor: Colors.black,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            Tab(
                              text: "About",
                            ),
                            Tab(text: "Attacks"),
                            Tab(text: "Evolution")
                          ]),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : AboutTab(
                            maxHp: provider.pokemon!.maxHp!,
                            minHeight: provider.pokemon!.minHeight!,
                            maxHeight: provider.pokemon!.maxHeight!,
                            minWeight: provider.pokemon!.minWeight!,
                            maxWeight: provider.pokemon!.maxWeight!,
                            weaknesses: provider.pokemon!.weaknesses!,
                            resistant: provider.pokemon!.resistant!,
                            fleeRate: provider.pokemon!.fleeRate!,
                            classification: provider.pokemon!.classification!,
                          ),
                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : AttacksTab(
                            fastAttacks: provider.pokemon!.fastAttacks!,
                            specialAttacks: provider.pokemon!.specialAttacks!,
                          ),
                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : EvolutionTab(
                            evolutions: provider.pokemon?.evolutions,
                            evolutionRequirementName:
                                provider.pokemon?.evolutionRequirementName,
                            evolutionRequirementAmount:
                                provider.pokemon?.evolutionRequirementAmount,
                          )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
