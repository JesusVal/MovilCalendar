import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviles_proyecto_v1/Views/Calendar/CalendarFields/calendarMapFunctions.dart';
import 'package:moviles_proyecto_v1/Views/Calendar/CalendarFields/calendarWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarController _calendarController; //Controlador de calendario
  TextEditingController _eventController; //Controlador del input de eventos

  Map<DateTime, List<dynamic>> _events; //Mapeador de días
  List<dynamic> _selectedEvents; //Lista de eventos

  SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
    _events = {};
    _eventController = TextEditingController();
    _selectedEvents = [];
    initPreferences();
  }

  initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    _events = Map<DateTime, List<dynamic>>.from(
        decodeMap(json.decode(preferences.getString('events') ?? "{}")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar.io'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
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
                setState(() {
                  _selectedEvents = events;
                });
              },
            ),
            Text('Text widget'),
            ..._selectedEvents.map((e) => ListTile(
                  title: Text(e),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              if (_eventController.text.isEmpty) return;
              setState(() {
                if (_events[_calendarController.selectedDay] != null) {
                  _events[_calendarController.selectedDay]
                      .add(_eventController.text);
                } else {
                  _events[_calendarController.selectedDay] = [
                    _eventController.text
                  ];
                }
                preferences.setString(
                    'events', json.encode(encodeMap(_events)));
                _eventController.clear();
                Navigator.pop(context);
              });
            },
            child: Text('save'),
          )
        ],
      ),
    );
  }
}
