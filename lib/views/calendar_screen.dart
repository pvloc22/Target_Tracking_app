import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../core/appbar_calendar.dart';
import '../core/bottomnavigatorbar.dart';
import '../data/model/task_model.dart';
import 'components/calendar_months.dart';
import 'components/calendar_weeks.dart';
import 'components/item_date_create_new_task.dart';
import 'components/item_task.dart';
import 'home/home_bloc.dart';
import 'home/home_event.dart';
import 'home/home_state.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String _selected = 'Week';

  /// Find the first date of the week which contains the provided date.
  DateTime findFirstDateOfTheWeek(DateTime dateTime, int index) {
    return dateTime.subtract(Duration(days: dateTime.weekday - index));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  void selectCalendar(String select) {
    setState(() {
      _selected = select;
    });
  }

  List<Task> listTask = [];
  void initState() {
    DateTime today = DateTime.now();
    context.read<HomeBloc>().add(
        FetchDataTaskOfDayEvent(date: "${DateFormat.yMMMd().format(today)}"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCalendar(
        onPressed: selectCalendar,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _selected == 'Week' ? const CalendarWeeks() : const CalendarMonths(),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              child: ItemDateCreateNewTask(date: 'Result'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: ListView.builder(
                  itemCount: state.listTodayTasks.length,
                  itemBuilder: (context, index) {
                    return ItemTask(task: state.listTodayTasks[index],);
                  },
                ),
              ),
            )
          ],
        );
      }),
      bottomNavigationBar: const BottomNavigatorBarTodolist(
        initIndex: 1,
      ),
    );
  }
}
