import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/constant.dart';

class PokelistPage {
  int offset = 0;
  int limit = DEFAULT_LIST_LIMIT;

  PokelistPage({required this.offset, required this.limit}) {
    // this.offset = offset;
    // this.limit = limit;
  }
}

class PokelistPageNotifier extends StateNotifier<PokelistPage>{
  PokelistPageNotifier(super.state);

  void addPage() {
    // state = PokelistPage(offset: state.offset, limit: state.limit + COUNT_MORE);
    state = PokelistPage(offset: state.offset, limit: min(state.limit + COUNT_MORE, POKE_MAX_ID));
    // debugPrint("state: ${state}");
  }
}
final pagenationProvider = StateNotifierProvider<PokelistPageNotifier, PokelistPage>(
  (ref) => PokelistPageNotifier(PokelistPage(offset: 0, limit: DEFAULT_LIST_LIMIT))
);