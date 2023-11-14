import 'package:flutter/material.dart';

// НЕ ОБНАВЛЯЕТСЯ _selectedTime
class MyCustomCalendar {
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
        return StatefulBuilder(builder: (context, StateSetter setStater) {
          return AlertDialog(
            content: SizedBox(
              // Задайте подходящий размер контейнера
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
                        setStater,
                        'Сегодня',
                        const Duration(days: 0),
                      ),

                      calendartextButton(
                        setStater,
                        'Завтра',
                        const Duration(days: 1),
                      ),
                      calendartextButton(
                        setStater,
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
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.black45)),
                        onPressed: () {
                          setStater(() {
                            _selectedTime = saturdayOf(DateTime.now());
                          });
                        },
                        child: Text(
                          'В эти выходные',
                          style: textStyle,
                        ),
                      ),
                      calendartextButton(
                        setStater,
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

                      setStater(() {
                        // починить что то сделал сам не понял
                        replayTime = DateTime(
                            _selectedTime.year,
                            _selectedTime.month,
                            _selectedTime.day,
                            timeToPick.hour,
                            timeToPick.minute);
                        replayTime;
                      });
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
                child: const Text('ОТМЕНА'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('ОК'),
                onPressed: () => Navigator.of(context).pop(_selectedTime),
              ),
            ],
          );
        });
      },
    );
  }

  TextButton calendartextButton(
      StateSetter setStater, String label, Duration duration) {
    return TextButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black45)),
      child: Text(label, style: textStyle),
      onPressed: () {
        setStater(() {
          _selectedTime = DateTime.now().add(duration);
        });
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
