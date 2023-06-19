import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_flutter_riverpod/api/pokeapi.dart';
import '../models/pokemon.dart';

final pokeMapProvider = ChangeNotifierProvider((ref) => PokeMapNotifier());

class PokeMapNotifier extends ChangeNotifier {
  //内部変数
  Map<String, Pokemon> pokeMap = {};

  /// 新しいPokemonを追加するメソッド
  void add(String id) {
    debugPrint("---------------------------");
    // debugPrint("call add ${id}!");
    // debugPrint("poke: ${state[id]}");
    if (pokeMap[id] == null) {
      fetchPokemon(id).then((pokemon) {
        debugPrint("get poke! ${pokemon}");
        pokeMap[id.toString()] = pokemon;
        notifyListeners();
      }).catchError((err) {
        debugPrint(err.toString());
      });
    }
  }

  // /// IDを指定して、TODOを削除するメソッド
  // void remove() {
  //   // state = [
  //   //   for (final todo in state)
  //   //     if (todo.id != todoId) todo,
  //   // ];
  // }
}