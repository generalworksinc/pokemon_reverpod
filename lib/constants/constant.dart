import 'dart:ui';

const SHARED_PREFERENCE_KEY_THEME_MODE = "theme_mode";
const int POKE_MAX_ID = 898;
const String ROUTE_POKE_API = "https://pokeapi.co/api/v2";

const DEFAULT_LIST_LIMIT = 10;
const COUNT_MORE = 10;

const Map<String, Color> COLORS_POKE_TYPE = {
  "normal": Color(0xFFA8A77A),
  "fire": Color(0xFFEE8130),
  "water": Color(0xFF6390F0),
  "electric": Color(0xFFF7D02C),
  "grass": Color(0xFF7AC74C),
  "ice": Color(0xFF96D9D6),
  "fighting": Color(0xFFC22E28),
  "poison": Color(0xFFA33EA1),
  "ground": Color(0xFFE2BF65),
  "flying": Color(0xFFA98FF3),
  "psychic": Color(0xFFF95587),
  "bug": Color(0xFFA6B91A),
  "rock": Color(0xFFB6A136),
  "ghost": Color(0xFF735797),
  "dragon": Color(0xFF6F35FC),
  "dark": Color(0xFF705746),
  "steel": Color(0xFFB7B7CE),
  "fairy": Color(0xFFD685AD),
};