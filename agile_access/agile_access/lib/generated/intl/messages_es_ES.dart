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

  static String m0(date, time) => " ${date} - ${time} ";

  static String m1(id) => "Puerta ${id}";

  static String m2(id) => "Opciones de la puerta ${id}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'Puertas Cerradas', one: 'Puerta Cerrada', other: 'Puertas Cerradas')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'Puertas Bloqueadas', one: 'Puerta Bloqueada', other: 'Puertas Bloqueadas')}";

  static String m5(count) =>
      "${Intl.plural(count, zero: 'Areas', one: 'Area', other: 'Areas')}";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'Puertas', one: 'Puerta', other: 'Puertas')}";

  static String m7(areaname) => " Areas de ${areaname}";

  static String m8(areaname) => "Puertas de ${areaname}";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'No tienes acceso a ninguna puerta', one: 'Tienes acceso a una puerta', other: 'Tienes acceso a ${count} puertas')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertScreenDoorButtonOpenClose": MessageLookupByLibrary.simpleMessage(
            "Desbloquea la peurta para poder abrirla."),
        "alertScreenDoorButtonUnlockShortly": MessageLookupByLibrary.simpleMessage(
            "Función no implementada. Se añadirá la función en una actualización futura."),
        "alertScreenHomeButtonFullLockUnlock": MessageLookupByLibrary.simpleMessage(
            "Hay puertas abiertas. Cierra todas las puertas para bloquear todo el edificio."),
        "alertScreenHomeButtonLockArea": MessageLookupByLibrary.simpleMessage(
            "Hay puertas abiertas. Cierra todas las puertas del área para bloquearla."),
        "alertScreenHomeNoAccessibleArea": MessageLookupByLibrary.simpleMessage(
            "No es possible acceder a dicha area, porque no hay puertas. \n Pónte en contacto con el administrador."),
        "alertScreenHomeNoDoorsInArea": MessageLookupByLibrary.simpleMessage(
            "no es possible bloquear todas las puertas del area, porque no dispone de puertas."),
        "alertTypeError":
            MessageLookupByLibrary.simpleMessage("Acción errónea"),
        "alertTypeInvalid":
            MessageLookupByLibrary.simpleMessage("Acción inválida"),
        "alertTypeNoAccessible":
            MessageLookupByLibrary.simpleMessage("Area no accesible"),
        "alertTypeNoLockArea":
            MessageLookupByLibrary.simpleMessage("Area no bloqueable"),
        "alertTypeNonFullLockable":
            MessageLookupByLibrary.simpleMessage("Edificio no bloqueable"),
        "close": MessageLookupByLibrary.simpleMessage("Cerrada"),
        "dateTime": m0,
        "doorHistory": MessageLookupByLibrary.simpleMessage("Historial"),
        "doorID": m1,
        "doorNoHistoryList": MessageLookupByLibrary.simpleMessage(
            "No has realizado ninguna acción con la puerta"),
        "doorOptions": m2,
        "doorsStatus": MessageLookupByLibrary.simpleMessage("Estado"),
        "groupAppBar":
            MessageLookupByLibrary.simpleMessage("Información del grupo"),
        "groupDescription": MessageLookupByLibrary.simpleMessage("Descripción"),
        "groupInfo": MessageLookupByLibrary.simpleMessage(
            "Información del grupo de la cuenta"),
        "groupName": MessageLookupByLibrary.simpleMessage("Nombre del grupo"),
        "homeAppBar": MessageLookupByLibrary.simpleMessage("Inicio"),
        "homeBuildingFloor":
            MessageLookupByLibrary.simpleMessage("Plantas del edificio"),
        "homeCardDoorsStatusClosed": m3,
        "homeCardDoorsStatusLocked": m4,
        "homeCardStatusWithAreas": m5,
        "homeCardStatusWithDoors": m6,
        "homeFloorAreas": m7,
        "informationAppBar":
            MessageLookupByLibrary.simpleMessage("Información del usuario"),
        "informationCredentials":
            MessageLookupByLibrary.simpleMessage("Credenciales"),
        "informationGroup": MessageLookupByLibrary.simpleMessage("Grupo"),
        "informationName": MessageLookupByLibrary.simpleMessage("Nombre"),
        "informationTitle": MessageLookupByLibrary.simpleMessage(
            "Información de la cuenta del usuario"),
        "lastVisitedAppBar":
            MessageLookupByLibrary.simpleMessage("Últimas vistas"),
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
        "scheduleEndDate":
            MessageLookupByLibrary.simpleMessage("Fecha de finalización"),
        "scheduleEndTime":
            MessageLookupByLibrary.simpleMessage("Hora de finalización"),
        "scheduleInformation":
            MessageLookupByLibrary.simpleMessage("Información del calendario"),
        "scheduleStartDate":
            MessageLookupByLibrary.simpleMessage("Fecha de inicio"),
        "scheduleStartTime":
            MessageLookupByLibrary.simpleMessage("Hora de inicio"),
        "scheduleWeekdays":
            MessageLookupByLibrary.simpleMessage("Días de la semana"),
        "spaceDoors": m8,
        "spaceNumDoors": m9,
        "unlocked": MessageLookupByLibrary.simpleMessage("Desbloqueada"),
        "userAppBar": MessageLookupByLibrary.simpleMessage("Perfil de usuario"),
        "userGroup": MessageLookupByLibrary.simpleMessage("Grupo"),
        "userGroupInformation": MessageLookupByLibrary.simpleMessage(
            "Información del grupo del usuario"),
        "userLanguage": MessageLookupByLibrary.simpleMessage("Idioma"),
        "userLanguageEnglish": MessageLookupByLibrary.simpleMessage("Inglés"),
        "userLanguageGerman": MessageLookupByLibrary.simpleMessage("Alemán"),
        "userLanguageSpanish": MessageLookupByLibrary.simpleMessage("Español"),
        "userSchedule": MessageLookupByLibrary.simpleMessage("Calendario"),
        "userScheduleInformation": MessageLookupByLibrary.simpleMessage(
            "Información del calendario del usuario"),
        "userTitle": MessageLookupByLibrary.simpleMessage("Cuenta de usuario"),
        "userUSer": MessageLookupByLibrary.simpleMessage("Usuario"),
        "userUserIngormation":
            MessageLookupByLibrary.simpleMessage("Información del usuario")
      };
}
