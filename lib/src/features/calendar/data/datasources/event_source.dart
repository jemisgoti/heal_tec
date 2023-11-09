import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:heal_tec/src/features/calendar/data/models/event.dart';

class EventSource {
  static List<CalendarEventData<Event>> generateEventsForToday(DateTime today) {
    final List<CalendarEventData<Event>> events = <CalendarEventData<Event>>[];

    DateTime startTime = DateTime(today.year, today.month, today.day, 8);

    final List<String> patientNames = <String>[
      'John',
      'Matthew',
      'Emily',
      'Olivia',
      'Sophia',
    ];
    final List<Color> colors = <Color>[
      Colors.blue,
      Colors.green,
      Colors.deepOrange,
      Colors.green,
      Colors.blue,
    ];

    for (int i = 0; i < 5; i++) {
      final DateTime endTime = startTime.add(const Duration(hours: 1));
      events.add(
        CalendarEventData<Event>(
          title: 'Appointment With ${patientNames[i]}',
          description: 'Medical Checkup for ${patientNames[i]}',
          startTime: startTime,
          endTime: endTime,
          date: today,
          event: Event(
            color: colors[i].withOpacity(0.5),
            title: 'Appointment With ${i + 1}',
          ),
        ),
      );

      // Add a half-hour break before the next appointment
      startTime = endTime.add(const Duration(minutes: 30));
    }

    return events;
  }
}
