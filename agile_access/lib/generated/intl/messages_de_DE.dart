// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de_DE locale. All the
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
  String get localeName => 'de_DE';

  static String m0(date, time) => " ${date} - ${time} ";

  static String m1(id) => "Tür ${id}";

  static String m2(id) => "${id} Optionen";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'verschlossene Türen', one: 'geschlossene Tür', other: 'verschlossene Türen')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'verschlossene Türen', one: 'verschlossene Tür', other: 'verschlossene Türen')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'Bereiche', one: 'Bereich', other: 'Bereiche')}";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'Türen', one: 'Tür', other: 'Türen')}";

  static String m7(areaname) => "${areaname} Bereiche";

  static String m8(areaname) => "${areaname} Türen";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Keine Türen vorhanden', one: 'Sie haben Zugang zu 1 Tür', other: 'Sie haben Zugang zu ${count} Türen')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "dateTime": m0,
        "doorHistory": MessageLookupByLibrary.simpleMessage("Geschichte"),
        "doorID": m1,
        "doorNoHistoryList":
            MessageLookupByLibrary.simpleMessage("Keine Daten im Verlauf"),
        "doorOptions": m2,
        "doorsStatus": MessageLookupByLibrary.simpleMessage("Status"),
        "homeAppBar": MessageLookupByLibrary.simpleMessage("Heim"),
        "homeBuildingFloor":
            MessageLookupByLibrary.simpleMessage("Gebäudeböden"),
        "homeCardDoorsStatusClosed": m3,
        "homeCardDoorsStatusLocked": m4,
        "homeCardStatusWithAreas": m5,
        "homeCardStatusWithDoors": m6,
        "homeFloorAreas": m7,
        "locked": MessageLookupByLibrary.simpleMessage("Gesperrt"),
        "logInEmpty": MessageLookupByLibrary.simpleMessage(
            "Bitte geben Sie den Namen Benutzer ein"),
        "logInFormTitle": MessageLookupByLibrary.simpleMessage("Anmeldung"),
        "logInLabelText": MessageLookupByLibrary.simpleMessage("Benutzer"),
        "logInNoUser":
            MessageLookupByLibrary.simpleMessage("Benutzer nicht gefunden"),
        "logInSumbit": MessageLookupByLibrary.simpleMessage("Einreichen"),
        "spaceDoors": m8,
        "spaceNumDoors": m9
      };
}
