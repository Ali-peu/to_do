
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/data/router/app_router.dart';

class AppMain extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppMain({required this.navigationShell, super.key});

  void _goBranch(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  // Future<void> _displayBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
  //       ),
  //       builder: (context) {
  //         // return SafeArea(
  //         //     child: ChangeNotifierProvider(
  //         //   create: (context) => AddTaskBottomSheetModelView(
  //         //       datebaseProviderForSubNote:
  //         //           Provider.of<DriftDatebaseProviderForSubNote>(context,
  //         //               listen: false),
  //         //       datebaseProviderForNote:
  //         //           Provider.of<DriftDatebaseProviderForNote>(context,
  //         //               listen: false)),
  //         //   child: const AddTaskBottomSheet(),
  //         // ));
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: navigationShell),
      floatingActionButton: Visibility(
        visible: router.routerDelegate.state?.path
                ?.toLowerCase()
                .compareTo(AppRouteNames.note.toLowerCase()) ==
            0,
        child: FloatingActionButton(
          onPressed: () {
            context.pushNamed(AppRouteNames.createNote);
            // _displayBottomSheet(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: navigationShell.currentIndex,
      //   destinations: const [
      //     NavigationDestination(
      //         label: 'Tasks', icon: Icon(Icons.format_list_bulleted_add)),
      //     // NavigationDestination(
      //     //     label: 'Calendar', icon: Icon(Icons.calendar_month_outlined)),
      //     // NavigationDestination(
      //     //     label: 'Account', icon: Icon(Icons.account_box)),
      //   ],
      //   onDestinationSelected: (index) {
      //     _goBranch(index, context);
      //   },
      // ),
    );
  }
}
