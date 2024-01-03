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

  static String m0(id) => "Tür ${id}";

  static String m1(id) => "${id} Optionen";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'verschlossene Türen', one: 'geschlossene Tür', other: 'verschlossene Türen')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'verschlossene Türen', one: 'verschlossene Tür', other: 'verschlossene Türen')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'Bereiche', one: 'Bereich', other: 'Bereiche')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'Türen', one: 'Tür', other: 'Türen')}";

  static String m6(areaname) => "${areaname} Bereiche";

  static String m7(areaname) => "${areaname} Türen";

  static String m8(count) =>
      "${Intl.plural(count, zero: 'Keine Türen vorhanden', one: 'Sie haben Zugang zu 1 Tür', other: 'Sie haben Zugang zu ${count} Türen')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "doorHistory": MessageLookupByLibrary.simpleMessage("Geschichte"),
        "doorID": m0,
        "doorNoHistoryList":
            MessageLookupByLibrary.simpleMessage("Keine Daten im Verlauf"),
        "doorOptions": m1,
        "doorsStatus": MessageLookupByLibrary.simpleMessage("Status"),
        "homeAppBar": MessageLookupByLibrary.simpleMessage("Heim"),
        "homeBuildingFloor":
            MessageLookupByLibrary.simpleMessage("Gebäudeböden"),
        "homeCardDoorsStatusClosed": m2,
        "homeCardDoorsStatusLocked": m3,
        "homeCardStatusWithAreas": m4,
        "homeCardStatusWithDoors": m5,
        "homeFloorAreas": m6,
        "locked": MessageLookupByLibrary.simpleMessage("Gesperrt"),
        "logInEmpty": MessageLookupByLibrary.simpleMessage(
            "Bitte geben Sie den Namen Benutzer ein"),
        "logInFormTitle": MessageLookupByLibrary.simpleMessage("Anmeldung"),
        "logInLabelText": MessageLookupByLibrary.simpleMessage("Benutzer"),
        "logInNoUser":
            MessageLookupByLibrary.simpleMessage("Benutzer nicht gefunden"),
        "logInSumbit": MessageLookupByLibrary.simpleMessage("Einreichen"),
        "spaceDoors": m7,
        "spaceNumDoors": m8
      };
}
