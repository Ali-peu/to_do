import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
import 'package:to_do/future/task_screens/add_task_bottom_sheet/add_task_bottom_sheet.dart';
import 'package:to_do/future/task_screens/add_task_bottom_sheet/add_task_bottom_sheet_model_view.dart';

class AppMain extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppMain({required this.navigationShell, super.key});

  void _goBranch(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context) {
          return SafeArea(
              child: AddTaskBottomSheet(
                  addTaskBottomSheetModelView: AddTaskBottomSheetModelView(
                      datebaseProviderForNote:
                          Provider.of<DriftDatebaseProviderForNote>(context,
                              listen: false))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: navigationShell),
      floatingActionButton: Visibility(
        visible: navigationShell.currentIndex == 2 ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            _displayBottomSheet(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
              label: 'Tasks', icon: Icon(Icons.format_list_bulleted_add)),
          NavigationDestination(
              label: 'Calendar', icon: Icon(Icons.calendar_month_outlined)),
          NavigationDestination(
              label: 'Account', icon: Icon(Icons.account_box)),
        ],
        onDestinationSelected: (index) {
          _goBranch(index, context);
        },
      ),
    );
  }
}
