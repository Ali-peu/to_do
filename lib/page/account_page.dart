import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import '../model/note.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

// MediaQuery.of(context).size.height * .60,
class _AccountPageState extends State<AccountPage> {
  void getBox() async {
    await Hive.openBox<Note>('box');
  }

  final box = Hive.box<Note>('box');

  @override
  void initState() {
    super.initState();

    final box = Hive.box<Note>('box');
    box.watch().listen((event) {
      getBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.account_box,
                  size: 25,
                )),
            title: Text("Account"),
            subtitle: Text(("sub Account")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: height * 0.2,
                width: width * 0.45,
                child: ColoredBox(
                  color: Colors.blue,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            box.values
                                .where((element) => element.isDone)
                                .length
                                .toString(),
                            style: const TextStyle(fontSize: 30)),
                        const Text('Выполненные задачи')
                      ]),
                ),
              ),
              SizedBox(
                height: height * 0.2,
                width: width * 0.45,
                child: ColoredBox(
                  color: Colors.blue,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            box.values
                                .where((element) => !element.isDone)
                                .length
                                .toString(),
                            style: const TextStyle(fontSize: 30)),
                        const Text('Невыполненные задачи')
                      ]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: width * 0.9,
            height: height * 0.4,
            color: Colors.white,
            child: const Center(child: Text("Тут должен быть график")),
          ),
        )
      ],
    );
  }
}
