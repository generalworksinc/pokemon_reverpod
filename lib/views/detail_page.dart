import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_flutter_riverpod/constants/constant.dart';

import '../models/pokemon.dart';
import '../providers/poke_map.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key, String? this.id}) : super(key: key);
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokeMap = ref.watch(pokeMapProvider);
    final pokeMapNotifier = ref.watch(pokeMapProvider.notifier);

    Pokemon? pokemon = pokeMap.pokeMap[id];
    if (id != null && pokemon == null) {
      pokeMapNotifier.add(id!);
    }

    return Scaffold(
      bottomSheet: IconButton(
        onPressed: () {
          context.goNamed('top');
        },
        icon: Icon(Icons.arrow_back),
      ),
      body: Container(
        color: (COLORS_POKE_TYPE[pokemon?.types.first] ?? Colors.grey[100])
            ?.withOpacity(.5),
        child: pokemon == null
            ? const CircularProgressIndicator()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "No.${id}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(32),
                            child: Image.network(
                              // "https://pokeapi.co/api/v2/pokemon/25"
                              pokemon.imageUrl,
                              height: 200,
                              width: 200,
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemon.types
                          .map((type) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Chip(
                                label: Text(
                                  type,
                                  style: TextStyle(
                                    color: (COLORS_POKE_TYPE[type] ??
                                                    Colors.grey[100])!
                                                .computeLuminance() >
                                            0.5
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    COLORS_POKE_TYPE[type] ?? Colors.grey[100],
                              )))
                          .toList(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
