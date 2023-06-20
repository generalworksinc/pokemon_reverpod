import 'package:go_router/go_router.dart';
import './views/top_page.dart';
import './views/detail_page.dart';
import './views/settings_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: 'top',
    path: '/',
    builder: (context, state) => TopPage(),
  ),
  GoRoute(
    name: 'settings',
    path: '/settings',
    builder: (context, state) => SettingsPage(),
  ),
  GoRoute(
    name: 'detail',
    path: '/detail/:id',
    builder: (context, state) => DetailPage(id: state.pathParameters['id']),
  ),
], initialLocation: '/');
