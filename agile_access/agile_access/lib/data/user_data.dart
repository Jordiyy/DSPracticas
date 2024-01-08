import 'package:agile_access/data/door_tree.dart';
import 'package:flutter/material.dart';

class User {
  late String name;
  late String credential;
  late List<Map<String, String>> history;
  late List<Area> lastVisited;

  User(this.name, this.credential, this.history, this.lastVisited);
}

class UserGroup {
  late String name;
  late String description;
  late List<String> areas;
  late Schedule schedule;
  late List<String> actions;
  late List<User> users;

  UserGroup(this.name, this.description, this.areas, this.schedule,
      this.actions, this.users);
}

class Schedule {
  late List<bool> weekdays; // DateTime.monday==1, DateTime.sunday==7
  late DateTime fromDate;
  late DateTime toDate;
  late TimeOfDay fromTime;
  late TimeOfDay toTime;

  Schedule(
      this.weekdays, this.fromDate, this.toDate, this.fromTime, this.toTime);
}

class ActionsDoor {
  static const String open = "open";
  static const String close = "close";
  static const String lock = "lock";
  static const String unlock = "unlock";
  static const String unlockShortly = "unlock_shortly";
  static List<String> all = <String>[open, close, lock, unlock, unlockShortly];
}

class usersData {
  // Admin
  static Schedule scheduleAdmin = Schedule([
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ],
      DateTime(2023, 1, 1),
      DateTime(2026, 1, 1),
      const TimeOfDay(hour: 0, minute: 0),
      const TimeOfDay(hour: 23, minute: 59));

  static UserGroup admin = UserGroup(
      "admin",
      "administrators",
      [
        "building",
      ],
      scheduleAdmin,
      ActionsDoor.all,
      [
        User("Ana", "89325", [], []),
        User("Aureli", "87325", [], []),
      ]);

  // Managers
  static Schedule scheduleManagers = Schedule([
    true,
    true,
    true,
    true,
    true,
    true,
    false,
  ],
      DateTime(2023, 9, 1),
      DateTime(2024, 8, 30),
      const TimeOfDay(hour: 7, minute: 0),
      const TimeOfDay(hour: 22, minute: 0));
  static UserGroup managers = UserGroup(
      "managers",
      "the CEO, CTO and heads of department",
      [
        "building",
      ],
      scheduleManagers,
      ActionsDoor.all,
      [
        User("Manel", "43762", [], []),
        User("Miquel", "77832", [], []),
        User("Maria", "89324", [], []),
        User("Maure", "12345", [], []),
      ]);

  // Employees
  static Schedule scheduleEmployees = Schedule([
    true,
    true,
    true,
    true,
    true,
    false,
    false,
  ],
      DateTime(2023, 9, 1),
      DateTime(2024, 3, 1),
      const TimeOfDay(hour: 7, minute: 0),
      const TimeOfDay(hour: 20, minute: 0));
  static UserGroup employees = UserGroup(
      "employees",
      "employees of own departments plus oursourcing companies",
      ["ground_floor", "room3", "corridor"],
      scheduleEmployees,
      [ActionsDoor.open, ActionsDoor.close, ActionsDoor.unlockShortly],
      [
        User("Eva", "89325", [], []),
        User("Eulalia", "87325", [], []),
        User("Esteve", "43623", [], []),
      ]);

  static List<UserGroup> userGroups = [admin, managers, employees];

  // defaults for new user group
  static Schedule defaultSchedule = Schedule([
    true,
    true,
    true,
    true,
    true,
    false,
    false,
  ],
      DateTime.now(),
      DateTime.now().add(const Duration(days: 365)),
      const TimeOfDay(hour: 8, minute: 0),
      const TimeOfDay(hour: 19, minute: 0));

  static List<String> defaultAreas = ["ground_floor", "room3", "corridor"];
  static List<String> defaultActions = ["open", "close"];
  static String defaultName = "new group";
  static String defaultDescription = "";
  static String defaultNameUser = "new user";
  static String defaultCredentialsUser = "00000";

  static Map<String, String> images = {
    'ana': 'https://transfer.sh/3iRwt5NrxB/ana.png',
    'aureli': 'https://transfer.sh/uJmCCYfIyo/aureli.png',
    'manel': 'https://transfer.sh/YjyToAcXBi/manel.png',
    'miquel': 'https://transfer.sh/e9gG26vGwA/miquel.png',
    'maria': 'https://transfer.sh/Rvr7QdRhFg/maria.png',
    'maure': 'https://transfer.sh/HtdTNmOoxY/maure.png',
    'eva': 'https://transfer.sh/odY7j2jvQS/eva.png',
    'eulalia': 'https://transfer.sh/1RBiljKI8T/eulalia.png',
    'esteve': 'https://transfer.sh/waTqvGuqyr/esteve.png',
    'new user': 'https://transfer.sh/xQ9fjTdhAK/new_user.png',
  };
}
