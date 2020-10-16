import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

Widget calendarioTable(
    Map<DateTime, List<dynamic>> _events,
    CalendarController _calendarController,
    TextEditingController _eventController,
    BuildContext context) {
  return TableCalendar(
    events: _events,
    initialCalendarFormat: CalendarFormat.month,
    calendarStyle: CalendarStyle(
      todayColor: Colors.blue,
      selectedColor: Theme.of(context).primaryColor,
      todayStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: Colors.white,
      ),
    ),
    calendarController: _calendarController,
    headerStyle: HeaderStyle(
      centerHeaderTitle: true,
      formatButtonDecoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20.0),
      ),
      formatButtonTextStyle: TextStyle(
        color: Colors.white,
      ),
      formatButtonShowsNext: true,
    ),
    startingDayOfWeek: StartingDayOfWeek.monday,
    onDaySelected: (day, events, holidays) {
      print("day- " + day.toIso8601String());
    },
  );
}
