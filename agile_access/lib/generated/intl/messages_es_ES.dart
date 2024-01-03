// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es_ES locale. All the
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
  String get localeName => 'es_ES';

  static String m0(id) => "Puerta ${id}";

  static String m1(id) => "Opciones de la puerta ${id}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Puertas Cerradas', one: 'Puerta Cerrada', other: 'Puertas Cerradas')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'Puertas Bloqueadas', one: 'Puerta Bloqueada', other: 'Puertas Bloqueadas')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'Areas', one: 'Area', other: 'Areas')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'Puertas', one: 'Puerta', other: 'Puertas')}";

  static String m6(areaname) => " Areas de ${areaname}";

  static String m7(areaname) => "Puertas de ${areaname}";

  static String m8(count) =>
      "${Intl.plural(count, zero: 'No tienes acceso a ninguna puerta', one: 'Tienes acceso a una puerta', other: 'Tienes acceso a ${count} puertas')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "close": MessageLookupByLibrary.simpleMessage("Cerrada"),
        "doorHistory": MessageLookupByLibrary.simpleMessage("Historial"),
        "doorID": m0,
        "doorNoHistoryList": MessageLookupByLibrary.simpleMessage(
            "No has realizado ninguna acción con la puerta"),
        "doorOptions": m1,
        "doorsStatus": MessageLookupByLibrary.simpleMessage("Estado"),
        "homeAppBar": MessageLookupByLibrary.simpleMessage("Inicio"),
        "homeBuildingFloor":
            MessageLookupByLibrary.simpleMessage("Plantas del edificio"),
        "homeCardDoorsStatusClosed": m2,
        "homeCardDoorsStatusLocked": m3,
        "homeCardStatusWithAreas": m4,
        "homeCardStatusWithDoors": m5,
        "homeFloorAreas": m6,
        "locked": MessageLookupByLibrary.simpleMessage("Bloqueada"),
        "logInEmpty":
            MessageLookupByLibrary.simpleMessage("Introduce un usuario válido"),
        "logInFormTitle":
            MessageLookupByLibrary.simpleMessage("Iniciar Sesión"),
        "logInLabelText": MessageLookupByLibrary.simpleMessage("Usuario"),
        "logInNoUser":
            MessageLookupByLibrary.simpleMessage("Usuario no encontrado"),
        "logInSumbit": MessageLookupByLibrary.simpleMessage("Entrar"),
        "open": MessageLookupByLibrary.simpleMessage("Abierta"),
        "spaceDoors": m7,
        "spaceNumDoors": m8,
        "unlocked": MessageLookupByLibrary.simpleMessage("Desbloqueada")
      };
}
