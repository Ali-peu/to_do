import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/app/app_main.dart';
// import 'package:to_do/future/account_page/account_page.dart';
// import 'package:to_do/future/calendar_page/calendar_page.dart';
import 'package:to_do/future/note_screens/note_screen/ui/note_screen.dart';
import 'package:to_do/future/note_screens/notes_screen/notes_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

abstract class AppRouteNames {
  static String note = '/note';
  static String createNote = 'new';
  static String editNote = '/edit_note';

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
            builder: const NotesScren(),
            routes: [
              GoRoute(
                path: AppRouteNames.createNote, // Путь для создания
                name: AppRouteNames.createNote,
                builder: (context, state) {
                  final noteId = state.pathParameters['id'];
                  return NoteScreen(
                      noteId: noteId != null ? int.tryParse(noteId) : null);
                },
              ),
              GoRoute(
                path:
                    '${AppRouteNames.createNote}/:id', // Путь для редактирования, где id - параметр
                name: AppRouteNames.editNote,
                builder: (context, state) {
                  final noteId = state.pathParameters['id'];
                  return NoteScreen(
                      noteId: noteId != null ? int.tryParse(noteId) : null);
                },
              ),
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
