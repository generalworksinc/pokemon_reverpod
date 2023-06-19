import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_flutter_riverpod/providers/list_offset.dart';
import '../constants/constant.dart';
import '/views/components/navigation_bar.dart';
import '/views/components/poke_item.dart';

class TopPage extends ConsumerWidget {
  const TopPage([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    PokelistPage pokelistPage = ref.watch(pagenationProvider);
    PokelistPageNotifier pokelistPageNotifier = ref.watch(pagenationProvider.notifier);

    debugPrint("offset: ${pokelistPage.offset}, limit:  ${pokelistPage.limit}");

    return Scaffold(
      body: ListView.builder(
        itemCount: pokelistPage.limit - pokelistPage.offset + 1,
        itemBuilder: (context, index) {
          if (index == pokelistPage.limit - pokelistPage.offset) {
            return OutlinedButton(
                onPressed: () => pokelistPageNotifier.addPage(),
                child: const Text('more'),
            );
          } else {
            return PokeItem(id: (pokelistPage.offset + index + 1).toString());
          }
        },
      ),
      bottomNavigationBar: botoom_navigation_bar(context),
    );
  }
}

