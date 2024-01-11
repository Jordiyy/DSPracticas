// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(date, time) => " ${date} - ${time} ";

  static String m1(id) => "Door ${id}";

  static String m2(id) => "${id} options";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'closed doors', one: 'closed door', other: 'closed doors')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'locked doors', one: 'locked door', other: 'locked doors')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'Areas', one: 'Area', other: 'Areas')}";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'Doors', one: 'Door', other: 'Doors')}";

  static String m7(areaname) => "${areaname} areas";

  static String m8(areaname) => "${areaname} doors";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'No doors available', one: 'You have acces to 1 door', other: 'You have acces to ${count} doors')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertScreenDoorButtonOpenClose": MessageLookupByLibrary.simpleMessage(
            "Unlock the door first so you can open it."),
        "alertScreenDoorButtonUnlockShortly": MessageLookupByLibrary.simpleMessage(
            "This function has not yet been implemented. In the future it will be operational."),
        "alertScreenHomeButtonFullLockUnlock": MessageLookupByLibrary.simpleMessage(
            "There are doors that are open. Close all doors to block the complete area."),
        "alertScreenHomeButtonLockArea": MessageLookupByLibrary.simpleMessage(
            "There are doors that are open. Close all doors to block the area."),
        "alertScreenHomeNoAccessibleArea": MessageLookupByLibrary.simpleMessage(
            "It is not possible to access the area, because it has no doors. \nContact the administrator."),
        "alertScreenHomeNoDoorsInArea": MessageLookupByLibrary.simpleMessage(
            "It is not possible to lock the doors of the area, because it does not have."),
        "alertTypeError": MessageLookupByLibrary.simpleMessage("Action error"),
        "alertTypeInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid action"),
        "alertTypeNoAccessible":
            MessageLookupByLibrary.simpleMessage("Non-accessible area"),
        "alertTypeNoLockArea":
            MessageLookupByLibrary.simpleMessage("Non-lockable area"),
        "alertTypeNonFullLockable":
            MessageLookupByLibrary.simpleMessage("Full non-lockable area"),
        "close": MessageLookupByLibrary.simpleMessage("Closed"),
        "dateTime": m0,
        "doorHistory": MessageLookupByLibrary.simpleMessage("History"),
        "doorID": m1,
        "doorNoHistoryList":
            MessageLookupByLibrary.simpleMessage("No data in history"),
        "doorOptions": m2,
        "doorsStatus": MessageLookupByLibrary.simpleMessage("Status"),
        "groupAppBar":
            MessageLookupByLibrary.simpleMessage("Group Information"),
        "groupDescription": MessageLookupByLibrary.simpleMessage("Description"),
        "groupInfo":
            MessageLookupByLibrary.simpleMessage("Group account Information"),
        "groupName": MessageLookupByLibrary.simpleMessage("Group name"),
        "homeAppBar": MessageLookupByLibrary.simpleMessage("Home"),
        "homeBuildingFloor":
            MessageLookupByLibrary.simpleMessage("Building floors"),
        "homeCardDoorsStatusClosed": m3,
        "homeCardDoorsStatusLocked": m4,
        "homeCardStatusWithAreas": m5,
        "homeCardStatusWithDoors": m6,
        "homeFloorAreas": m7,
        "informationAppBar":
            MessageLookupByLibrary.simpleMessage("User Information"),
        "informationCredentials":
            MessageLookupByLibrary.simpleMessage("Credentials"),
        "informationGroup": MessageLookupByLibrary.simpleMessage("Group"),
        "informationName": MessageLookupByLibrary.simpleMessage("Name"),
        "informationTitle":
            MessageLookupByLibrary.simpleMessage("User account Information"),
        "lastVisitedAppBar":
            MessageLookupByLibrary.simpleMessage("Last visited"),
        "locked": MessageLookupByLibrary.simpleMessage("Locked"),
        "logInEmpty":
            MessageLookupByLibrary.simpleMessage("Please enter name user"),
        "logInFormTitle": MessageLookupByLibrary.simpleMessage("Log In"),
        "logInLabelText": MessageLookupByLibrary.simpleMessage("User"),
        "logInNoUser": MessageLookupByLibrary.simpleMessage("User not found"),
        "logInSumbit": MessageLookupByLibrary.simpleMessage("Submit"),
        "open": MessageLookupByLibrary.simpleMessage("Opened"),
        "scheduleEndDate": MessageLookupByLibrary.simpleMessage("End date"),
        "scheduleEndTime": MessageLookupByLibrary.simpleMessage("End time"),
        "scheduleInformation":
            MessageLookupByLibrary.simpleMessage("Schedule Information"),
        "scheduleStartDate": MessageLookupByLibrary.simpleMessage("Start date"),
        "scheduleStartTime": MessageLookupByLibrary.simpleMessage("Start time"),
        "scheduleWeekdays": MessageLookupByLibrary.simpleMessage("Weekdays"),
        "spaceDoors": m8,
        "spaceNumDoors": m9,
        "unlocked": MessageLookupByLibrary.simpleMessage("Unlocked"),
        "userAppBar": MessageLookupByLibrary.simpleMessage("User profile"),
        "userGroup": MessageLookupByLibrary.simpleMessage("Group"),
        "userGroupInformation":
            MessageLookupByLibrary.simpleMessage("User group information"),
        "userLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "userLanguageEnglish": MessageLookupByLibrary.simpleMessage("English"),
        "userLanguageGerman": MessageLookupByLibrary.simpleMessage("German"),
        "userLanguageSpanish": MessageLookupByLibrary.simpleMessage("Spanish"),
        "userSchedule": MessageLookupByLibrary.simpleMessage("Schedule"),
        "userScheduleInformation":
            MessageLookupByLibrary.simpleMessage("User schedule information"),
        "userTitle": MessageLookupByLibrary.simpleMessage("User account"),
        "userUSer": MessageLookupByLibrary.simpleMessage("User"),
        "userUserIngormation":
            MessageLookupByLibrary.simpleMessage("User information")
      };
}
