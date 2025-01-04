import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/app/app_main.dart';
// import 'package:to_do/future/account_page/account_page.dart';
// import 'package:to_do/future/calendar_page/calendar_page.dart';
import 'package:to_do/future/note_screens/note_screen/ui/note_screen.dart';
import 'package:to_do/future/note_screens/notes_screen/tasks_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

abstract class AppRouteNames {
  static String note = '/note';
  static String createNote = 'create_note';

  static String calendar = '/calendar';
  static String account = '/account';
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRouteNames.note,
  routes: <RouteBase>[
    // #docregion configuration-builder
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppMain(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        statefulShellBranch(
            path: AppRouteNames.note,
            builder: const NoteScreen(),
            routes: [
              GoRoute(
                path: AppRouteNames.createNote,
                name: AppRouteNames.createNote,
                builder: (context, state) => const NoteScreen(),
              )
            ]),
        // statefulShellBranch(
        //     path: AppRouteNames.calendar, builder: const CalendarPage()),
        // statefulShellBranch(
        //     path: AppRouteNames.account, builder: const AccountPage()),
      ],
    ),
  ],
);

StatefulShellBranch statefulShellBranch(
    {required String path,
    required Widget builder,
    required List<RouteBase> routes}) {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(path: path, builder: (context, state) => builder, routes: routes),
    ],
  );
}
