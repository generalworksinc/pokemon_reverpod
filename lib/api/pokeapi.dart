import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../constants/constant.dart';
import '../models/pokemon.dart';

Future<Pokemon> fetchPokemon(String id) async {
  String url = "$ROUTE_POKE_API/pokemon/$id";
  debugPrint("url: $url");
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    var resString = res.body;
    // debugPrint("res body: $resString");
    var decoded = jsonDecode(resString);
    // debugPrint("res decoded: $decoded");
    return Pokemon.fromJson(decoded);
  } else {
    throw Exception('Failed to Load Pokemon');
  }
}