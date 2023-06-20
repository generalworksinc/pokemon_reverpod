import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/constant.dart';
import '../../models/pokemon.dart';
import '../../providers/poke_map.dart';

class PokeItem extends ConsumerWidget {
  // const PokemonButton({Key? key}) : super(key: key);
  const PokeItem({Key? key, required String this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokeMap = ref.watch(pokeMapProvider);
    final pokeMapNotifier = ref.watch(pokeMapProvider.notifier);
    Pokemon? poke = pokeMap.pokeMap[id];
    debugPrint("rebuild!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

    if (poke == null) {
      pokeMapNotifier.add(id);
      return ListTile(
        leading: const CircularProgressIndicator(),
      );
    } else {
      return ListTile(
        leading: Container(
          width: 80,
          decoration: BoxDecoration(
            color: (COLORS_POKE_TYPE[poke.types.first] ?? Colors.grey[100])
                ?.withOpacity(.3),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                poke.imageUrl,
              ),
            ),
          ),
        ),
        title: Text(poke.name),
        subtitle: Row(
            children: poke.types
                .map<Padding>((type) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text(type)))
                .toList()),
        // trailing: Icon(Icons.keyboard_arrow_right),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          context.pushNamed('detail', pathParameters: {'id': id.toString()});
        },
      );
    }
  }
}
