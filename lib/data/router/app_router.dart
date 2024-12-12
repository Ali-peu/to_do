import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/app/app_main.dart';
import 'package:to_do/future/account_page/account_page.dart';
import 'package:to_do/future/calendar_page/calendar_page.dart';
import 'package:to_do/future/task_screens/task_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

abstract class AppRouteNames {
  static String main = '/main';
  static String calendar = '/calendar';
  static String account = '/account';
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRouteNames.main,
  routes: <RouteBase>[
    // #docregion configuration-builder
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppMain(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        statefulShellBranch(
            path: AppRouteNames.main, builder: const TaskPage()),
        statefulShellBranch(
            path: AppRouteNames.calendar, builder: const CalendarPage()),
        statefulShellBranch(
            path: AppRouteNames.account, builder: const AccountPage()),
      ],
    ),
  ],
);

StatefulShellBranch statefulShellBranch(
    {required String path, required Widget builder}) {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: path,
        builder: (context, state) => builder,
      ),
    ],
  );
}
