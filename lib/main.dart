import 'package:flutter/material.dart';
import 'package:pokemon_flutter_riverpod/constants/constant.dart';
import 'package:pokemon_flutter_riverpod/providers/shared_preference.dart';
import 'package:pokemon_flutter_riverpod/providers/theme_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/providers/shared_preference.dart';
import '/router.dart';
import 'enum/theme_mode.dart';

Future<void> main() async {
  // `runApp` 関数が終わる前に何か処理を実行する場合は `ensureInitialized()` メソッドを追記する必要がある
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();

  //初期データ取得
  ThemeMode defaultThemeMode = themeModeFromString(
      sharedPreference.getString(SHARED_PREFERENCE_KEY_THEME_MODE));

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreference),
      themeModeProvider.overrideWithValue(StateController(defaultThemeMode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'Pokemon Flutter',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),ß
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      routerConfig: router,
    );
  }
}
