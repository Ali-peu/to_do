import 'package:flutter/material.dart';

// НЕ ОБНАВЛЯЕТСЯ _selectedTime
class MyCustomCalendar extends ChangeNotifier {
  // final DateTime Function() callbackDateTime;
  MyCustomCalendar();

  DateTime weekdayOf(DateTime time, int weekday) =>
      time.add(Duration(days: weekday - time.weekday));
  DateTime _selectedTime = DateTime.now();
  DateTime? replayTime;

  get selectedTime => _selectedTime;

  DateTime saturdayOf(DateTime time) => weekdayOf(time, 5);

  TimeOfDay timeOfDay = TimeOfDay.now();
  TextStyle textStyle = const TextStyle(
    color: Colors.black,
  );

  Future<DateTime?> showCustomDatePickerPac(BuildContext context) {
    return showDialog<DateTime>(
      context: context,
      builder: (context) {
        return Builder(builder: (context) {
          return AlertDialog(
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CalendarDatePicker(
                    initialDate: _selectedTime,
                    firstDate: DateTime(2023, 1, 1),
                    lastDate: DateTime(2025),
                    onDateChanged: (DateTime date) {
                      _selectedTime = date;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Добавьте свои кнопки здесь
                      calendartextButton(
                        'Сегодня',
                        const Duration(days: 0),
                      ),

                      calendartextButton(
                        'Завтра',
                        const Duration(days: 1),
                      ),
                      calendartextButton(
                        'Через 3 дня',
                        const Duration(days: 3),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll<Color>(Colors.black45)),
                        onPressed: () {
                          _selectedTime = saturdayOf(DateTime.now());
                        },
                        child: Text(
                          'В эти выходные',
                          style: textStyle,
                        ),
                      ),
                      calendartextButton(
                        'Через неделю',
                        const Duration(days: 7),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      TimeOfDay? timeToPick = await showTimePicker(
                          context: context,
                          initialTime: timeOfDay,
                          initialEntryMode: TimePickerEntryMode.dialOnly);
                      if (timeToPick == null) return;

                      replayTime = DateTime(
                          _selectedTime.year,
                          _selectedTime.month,
                          _selectedTime.day,
                          timeToPick.hour,
                          timeToPick.minute);

                    },
                    child: ListTile(
                        leading: const Icon(Icons.access_time_rounded),
                        title: const Text('Время'),
                        trailing: Text(
                          replayTime == null
                              ? 'Нет'
                              : TimeOfDay.fromDateTime(replayTime!).toString(),
                        )),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('ОТМЕНА', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ОК', style: TextStyle(color: Colors.red)),
                onPressed: () => Navigator.of(context).pop(_selectedTime),
              ),
            ],
          );
        });
      },
    );
  }

  TextButton calendartextButton(String label, Duration duration) {
    return TextButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.black45)),
      child: Text(label, style: textStyle),
      onPressed: () {
        _selectedTime = DateTime.now().add(duration);
        notifyListeners();
      },
    );
  }

  TextButton calendarTextButton(
      StateSetter setStater, String label, Duration duration) {
    return TextButton(
      child: Text(label),
      onPressed: () {
        setStater(() {
          _selectedTime = DateTime.now().add(duration);
        });
      },
    );
  }
}
