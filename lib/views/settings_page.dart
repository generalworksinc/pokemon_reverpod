import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_flutter_riverpod/providers/shared_preference.dart';
import '/views/components/navigation_bar.dart';
import '/constants/constant.dart';
import '/providers/theme_mode.dart';
import '/router.dart';
import '/enum/theme_mode.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    // final _themeMode = ThemeMode.system;
    final themeModeNotifier = ref.watch(themeModeProvider.notifier);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.lightbulb),
            title:  Text('Dark / Light Mode'),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System'),
            value: ThemeMode.system,
            groupValue: themeMode,
            onChanged: (ThemeMode? mode) {
              debugPrint("mode: ${mode}");
              themeModeNotifier.update((state) => mode!);
              sharedPreferences.setString(SHARED_PREFERENCE_KEY_THEME_MODE, mode!.modeName!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (mode) {
              debugPrint("mode: ${mode}");
              themeModeNotifier.update((state) => mode!);
              sharedPreferences.setString(SHARED_PREFERENCE_KEY_THEME_MODE, mode!.modeName!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: themeMode,
            onChanged: (mode) {
              debugPrint("mode: ${mode}");
              themeModeNotifier.update((state) => mode!);
              sharedPreferences.setString(SHARED_PREFERENCE_KEY_THEME_MODE, mode!.modeName!);
            },
          ),

        ],
      ),
      bottomNavigationBar: botoom_navigation_bar(context),
    );
  }

}