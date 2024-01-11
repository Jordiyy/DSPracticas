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
        "alertScreenDoorButtonOpenClose": MessageLookupByLibrary.simpleMessage(
            "Entriegeln Sie zuerst die Tür, damit Sie sie öffnen können."),
        "alertScreenDoorButtonUnlockShortly": MessageLookupByLibrary.simpleMessage(
            "Diese Funktion ist noch nicht implementiert. In Zukunft wird es betriebsbereit sein."),
        "alertScreenHomeButtonFullLockUnlock": MessageLookupByLibrary.simpleMessage(
            "Es gibt Türen, die offen stehen. Schließen Sie alle Türen, um den gesamten Bereich abzusperren."),
        "alertScreenHomeButtonLockArea": MessageLookupByLibrary.simpleMessage(
            "Es gibt Türen, die offen stehen. Schließen Sie alle Türen, um den Bereich zu blockieren."),
        "alertScreenHomeNoAccessibleArea": MessageLookupByLibrary.simpleMessage(
            "Der Zugang zum Bereich ist nicht möglich, da er über keine Türen verfügt. \nKontaktieren Sie den Administrator."),
        "alertScreenHomeNoDoorsInArea": MessageLookupByLibrary.simpleMessage(
            "Es ist nicht möglich, die Türen des Bereichs zu verriegeln, da dies nicht der Fall ist."),
        "alertTypeError": MessageLookupByLibrary.simpleMessage("Aktionsfehler"),
        "alertTypeInvalid":
            MessageLookupByLibrary.simpleMessage("Ungültige Aktion"),
        "alertTypeNoAccessible":
            MessageLookupByLibrary.simpleMessage("Nicht zugänglicher Bereich"),
        "alertTypeNoLockArea": MessageLookupByLibrary.simpleMessage(
            "Nicht abschließbarer Bereich"),
        "alertTypeNonFullLockable": MessageLookupByLibrary.simpleMessage(
            "Vollständig nicht abschließbarer Bereich"),
        "dateTime": m0,
        "doorHistory": MessageLookupByLibrary.simpleMessage("Geschichte"),
        "doorID": m1,
        "doorNoHistoryList":
            MessageLookupByLibrary.simpleMessage("Keine Daten im Verlauf"),
        "doorOptions": m2,
        "doorsStatus": MessageLookupByLibrary.simpleMessage("Status"),
        "groupAppBar":
            MessageLookupByLibrary.simpleMessage("Gruppeninformationen"),
        "groupDescription":
            MessageLookupByLibrary.simpleMessage("Beschreibung"),
        "groupInfo": MessageLookupByLibrary.simpleMessage(
            "Informationen zum Gruppenkonto"),
        "groupName": MessageLookupByLibrary.simpleMessage("Gruppenname"),
        "homeAppBar": MessageLookupByLibrary.simpleMessage("Heim"),
        "homeBuildingFloor":
            MessageLookupByLibrary.simpleMessage("Gebäudeböden"),
        "homeCardDoorsStatusClosed": m3,
        "homeCardDoorsStatusLocked": m4,
        "homeCardStatusWithAreas": m5,
        "homeCardStatusWithDoors": m6,
        "homeFloorAreas": m7,
        "informationAppBar":
            MessageLookupByLibrary.simpleMessage("Nutzerinformation"),
        "informationCredentials":
            MessageLookupByLibrary.simpleMessage("Referenzen"),
        "informationGroup": MessageLookupByLibrary.simpleMessage("Gruppe"),
        "informationName": MessageLookupByLibrary.simpleMessage("Name"),
        "informationTitle": MessageLookupByLibrary.simpleMessage(
            "Informationen zum Benutzerkonto"),
        "lastVisitedAppBar":
            MessageLookupByLibrary.simpleMessage("Zuletzt besucht"),
        "locked": MessageLookupByLibrary.simpleMessage("Gesperrt"),
        "logInEmpty": MessageLookupByLibrary.simpleMessage(
            "Bitte geben Sie den Namen Benutzer ein"),
        "logInFormTitle": MessageLookupByLibrary.simpleMessage("Anmeldung"),
        "logInLabelText": MessageLookupByLibrary.simpleMessage("Benutzer"),
        "logInNoUser":
            MessageLookupByLibrary.simpleMessage("Benutzer nicht gefunden"),
        "logInSumbit": MessageLookupByLibrary.simpleMessage("Einreichen"),
        "scheduleEndDate": MessageLookupByLibrary.simpleMessage("Endtermin"),
        "scheduleEndTime": MessageLookupByLibrary.simpleMessage("Endzeit"),
        "scheduleInformation":
            MessageLookupByLibrary.simpleMessage("Zeitplaninformationen"),
        "scheduleStartDate": MessageLookupByLibrary.simpleMessage("Startdatum"),
        "scheduleStartTime": MessageLookupByLibrary.simpleMessage("Startzeit"),
        "scheduleWeekdays": MessageLookupByLibrary.simpleMessage("Wochentags"),
        "spaceDoors": m8,
        "spaceNumDoors": m9,
        "userAppBar": MessageLookupByLibrary.simpleMessage("Benutzerprofil"),
        "userGroup": MessageLookupByLibrary.simpleMessage("Gruppe"),
        "userGroupInformation": MessageLookupByLibrary.simpleMessage(
            "Informationen zur Benutzergruppe"),
        "userLanguage": MessageLookupByLibrary.simpleMessage("Sprache"),
        "userLanguageEnglish": MessageLookupByLibrary.simpleMessage("Englisch"),
        "userLanguageGerman": MessageLookupByLibrary.simpleMessage("Deutsch"),
        "userLanguageSpanish": MessageLookupByLibrary.simpleMessage("Spanisch"),
        "userSchedule": MessageLookupByLibrary.simpleMessage("Zeitplan"),
        "userScheduleInformation": MessageLookupByLibrary.simpleMessage(
            "Informationen zum Benutzerplan"),
        "userTitle": MessageLookupByLibrary.simpleMessage("Benutzerkonto"),
        "userUSer": MessageLookupByLibrary.simpleMessage("Benutzer"),
        "userUserIngormation":
            MessageLookupByLibrary.simpleMessage("Nutzerinformation")
      };
}
