import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/features/calendar/data/datasources/event_source.dart';
import 'package:heal_tec/src/features/calendar/data/models/event.dart';
import 'package:heal_tec/src/features/calendar/presentation/widgets/day_view.dart';
import 'package:intl/intl.dart';

class DayView extends StatelessWidget {
  const DayView({super.key});

  @override
  Widget build(BuildContext context) => CalendarControllerProvider<Event>(
        controller: EventController<Event>()
          ..addAll(EventSource.generateEventsForToday(DateTime.now())),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: const Text(
              'Meetings',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            elevation: 8,
            backgroundColor: primaryColor,
            onPressed: () async {
              // final CalendarEventData<Event>? event =
              //     await context.pushRoute<CalendarEventData<Event>>(
              //   CreateEventPage(
              //     withDuration: true,
              //   ),
              // );
              // if (event == null) return;
              // CalendarControllerProvider.of<Event>(context).controller.add(event);
            },
            child: const Icon(Icons.add),
          ),
          body: const DayViewWidget(),
        ),
      );
}
