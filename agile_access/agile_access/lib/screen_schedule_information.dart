import 'package:agile_access/utils/nav_functions.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:agile_access/generated/l10n.dart';

import 'package:agile_access/data/user_data.dart';
import 'nav_bar.dart';

class ScreenScheduleInformation extends StatefulWidget {
  UserGroup userGroup;
  User userData;

  ScreenScheduleInformation({
    super.key,
    required this.userGroup,
    required this.userData,
  });

  @override
  State<ScreenScheduleInformation> createState() =>
      _ScreenScheduleInformation();
}

class _ScreenScheduleInformation extends State<ScreenScheduleInformation> {
  late UserGroup userGroup;
  late User userData;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavBar(
            ItemNavSelected: (index) =>
                ItemNavSelected(context, index, userGroup, userData)).bar,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text("${S.of(context).scheduleInformation}"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Text(
              "${S.of(context).scheduleInformation}",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).scheduleStartDate}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(userGroup.schedule.fromDate.toString(),
                        style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              )),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).scheduleEndDate}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(userGroup.schedule.toDate.toString(),
                        style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              )),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).scheduleWeekdays}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    WeekdaySelector(
                      selectedColor: Colors.blue,
                      onChanged: (value) {},
                      values: userGroup.schedule.weekdays,
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).scheduleStartTime}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(userGroup.schedule.fromTime.toString(),
                        style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              )),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).scheduleEndTime}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(userGroup.schedule.toTime.toString(),
                        style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              )),
            ),
          ],
        ));
  }
}
