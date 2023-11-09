import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/features/calendar/data/models/event.dart';
import 'package:intl/intl.dart';

class DayViewWidget extends StatelessWidget {
  const DayViewWidget({
    super.key,
    this.state,
    this.width,
  });
  final GlobalKey<DayViewState>? state;
  final double? width;

  @override
  Widget build(BuildContext context) => DayView<Event>(
        key: state,
        width: width,
        startDuration: const Duration(hours: 8),
        showHalfHours: true,
        dayTitleBuilder: (DateTime date) => Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 63,
              ),
              const VerticalDivider(
                width: 1,
              ),
              Text(
                DateFormat('dd MMM yyyy').format(date),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff101010),
                  height: 24 / 16,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        heightPerMinute: 1.15,
        timeLineWidth: 54,
        timeLineBuilder: _timeLineBuilder,
        hourIndicatorSettings: HourIndicatorSettings(
          color: Theme.of(context).dividerColor,
        ),
        halfHourIndicatorSettings: HourIndicatorSettings(
          color: Theme.of(context).dividerColor,
          lineStyle: LineStyle.dashed,
        ),
        liveTimeIndicatorSettings: const HourIndicatorSettings(
          color: primaryColor,
        ),
        eventTileBuilder: (
          DateTime date,
          List<CalendarEventData<Event>> events,
          Rect boundary,
          DateTime startDuration,
          DateTime endDuration,
        ) =>
            ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: events.first.event!.color.withAlpha(60),

              border: Border(
                left: BorderSide(width: 4, color: events.first.event!.color),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  events.first.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const Gap(12),
                Text(events.first.description),
              ],
            ),
          ),
        ),
      );

  Widget _timeLineBuilder(DateTime date) {
    if (date.minute != 0) {
      return Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned.fill(
            top: -8,
            right: 8,
            child: Text(
              '${date.hour}:${date.minute}',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black.withAlpha(50),
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    }

    final int hour = ((date.hour - 1) % 12) + 1;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned.fill(
          top: -8,
          right: 8,
          child: Text(
            "$hour ${date.hour ~/ 12 == 0 ? "am" : "pm"}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
