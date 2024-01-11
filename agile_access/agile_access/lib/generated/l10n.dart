// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bloqueada`
  String get locked {
    return Intl.message(
      'Bloqueada',
      name: 'locked',
      desc: '',
      args: [],
    );
  }

  /// `Desbloqueada`
  String get unlocked {
    return Intl.message(
      'Desbloqueada',
      name: 'unlocked',
      desc: '',
      args: [],
    );
  }

  /// `Abierta`
  String get open {
    return Intl.message(
      'Abierta',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Cerrada`
  String get close {
    return Intl.message(
      'Cerrada',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesión`
  String get logInFormTitle {
    return Intl.message(
      'Iniciar Sesión',
      name: 'logInFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Usuario`
  String get logInLabelText {
    return Intl.message(
      'Usuario',
      name: 'logInLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Introduce un usuario válido`
  String get logInEmpty {
    return Intl.message(
      'Introduce un usuario válido',
      name: 'logInEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Usuario no encontrado`
  String get logInNoUser {
    return Intl.message(
      'Usuario no encontrado',
      name: 'logInNoUser',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get logInSumbit {
    return Intl.message(
      'Entrar',
      name: 'logInSumbit',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get homeAppBar {
    return Intl.message(
      'Inicio',
      name: 'homeAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Plantas del edificio`
  String get homeBuildingFloor {
    return Intl.message(
      'Plantas del edificio',
      name: 'homeBuildingFloor',
      desc: '',
      args: [],
    );
  }

  /// ` Areas de {areaname}`
  String homeFloorAreas(Object areaname) {
    return Intl.message(
      ' Areas de $areaname',
      name: 'homeFloorAreas',
      desc: '',
      args: [areaname],
    );
  }

  /// `{count, plural, =0{Areas} =1{Area} other{Areas}}`
  String homeCardStatusWithAreas(num count) {
    return Intl.plural(
      count,
      zero: 'Areas',
      one: 'Area',
      other: 'Areas',
      name: 'homeCardStatusWithAreas',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{Puertas} =1{Puerta} other{Puertas}}`
  String homeCardStatusWithDoors(num count) {
    return Intl.plural(
      count,
      zero: 'Puertas',
      one: 'Puerta',
      other: 'Puertas',
      name: 'homeCardStatusWithDoors',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{Puertas Bloqueadas} =1{Puerta Bloqueada} other{Puertas Bloqueadas}}`
  String homeCardDoorsStatusLocked(num count) {
    return Intl.plural(
      count,
      zero: 'Puertas Bloqueadas',
      one: 'Puerta Bloqueada',
      other: 'Puertas Bloqueadas',
      name: 'homeCardDoorsStatusLocked',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{Puertas Cerradas} =1{Puerta Cerrada} other{Puertas Cerradas}}`
  String homeCardDoorsStatusClosed(num count) {
    return Intl.plural(
      count,
      zero: 'Puertas Cerradas',
      one: 'Puerta Cerrada',
      other: 'Puertas Cerradas',
      name: 'homeCardDoorsStatusClosed',
      desc: '',
      args: [count],
    );
  }

  /// `Puertas de {areaname}`
  String spaceDoors(Object areaname) {
    return Intl.message(
      'Puertas de $areaname',
      name: 'spaceDoors',
      desc: '',
      args: [areaname],
    );
  }

  /// `{count, plural, =0{No tienes acceso a ninguna puerta} =1{Tienes acceso a una puerta} other{Tienes acceso a {count} puertas}}`
  String spaceNumDoors(num count) {
    return Intl.plural(
      count,
      zero: 'No tienes acceso a ninguna puerta',
      one: 'Tienes acceso a una puerta',
      other: 'Tienes acceso a $count puertas',
      name: 'spaceNumDoors',
      desc: '',
      args: [count],
    );
  }

  /// `Puerta {id}`
  String doorID(Object id) {
    return Intl.message(
      'Puerta $id',
      name: 'doorID',
      desc: '',
      args: [id],
    );
  }

  /// `Opciones de la puerta {id}`
  String doorOptions(Object id) {
    return Intl.message(
      'Opciones de la puerta $id',
      name: 'doorOptions',
      desc: '',
      args: [id],
    );
  }

  /// `Estado`
  String get doorsStatus {
    return Intl.message(
      'Estado',
      name: 'doorsStatus',
      desc: '',
      args: [],
    );
  }

  /// `Historial`
  String get doorHistory {
    return Intl.message(
      'Historial',
      name: 'doorHistory',
      desc: '',
      args: [],
    );
  }

  /// `No has realizado ninguna acción con la puerta`
  String get doorNoHistoryList {
    return Intl.message(
      'No has realizado ninguna acción con la puerta',
      name: 'doorNoHistoryList',
      desc: '',
      args: [],
    );
  }

  /// ` {date} - {time} `
  String dateTime(DateTime date, DateTime time) {
    final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    final DateFormat timeDateFormat = DateFormat.jm(Intl.getCurrentLocale());
    final String timeString = timeDateFormat.format(time);

    return Intl.message(
      ' $dateString - $timeString ',
      name: 'dateTime',
      desc: '',
      args: [dateString, timeString],
    );
  }

  /// `Perfil de usuario`
  String get userAppBar {
    return Intl.message(
      'Perfil de usuario',
      name: 'userAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Cuenta de usuario`
  String get userTitle {
    return Intl.message(
      'Cuenta de usuario',
      name: 'userTitle',
      desc: '',
      args: [],
    );
  }

  /// `Usuario`
  String get userUSer {
    return Intl.message(
      'Usuario',
      name: 'userUSer',
      desc: '',
      args: [],
    );
  }

  /// `Información del usuario`
  String get userUserIngormation {
    return Intl.message(
      'Información del usuario',
      name: 'userUserIngormation',
      desc: '',
      args: [],
    );
  }

  /// `Grupo`
  String get userGroup {
    return Intl.message(
      'Grupo',
      name: 'userGroup',
      desc: '',
      args: [],
    );
  }

  /// `Información del grupo del usuario`
  String get userGroupInformation {
    return Intl.message(
      'Información del grupo del usuario',
      name: 'userGroupInformation',
      desc: '',
      args: [],
    );
  }

  /// `Calendario`
  String get userSchedule {
    return Intl.message(
      'Calendario',
      name: 'userSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Información del calendario del usuario`
  String get userScheduleInformation {
    return Intl.message(
      'Información del calendario del usuario',
      name: 'userScheduleInformation',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get userLanguage {
    return Intl.message(
      'Idioma',
      name: 'userLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Español`
  String get userLanguageSpanish {
    return Intl.message(
      'Español',
      name: 'userLanguageSpanish',
      desc: '',
      args: [],
    );
  }

  /// `Inglés`
  String get userLanguageEnglish {
    return Intl.message(
      'Inglés',
      name: 'userLanguageEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Alemán`
  String get userLanguageGerman {
    return Intl.message(
      'Alemán',
      name: 'userLanguageGerman',
      desc: '',
      args: [],
    );
  }

  /// `Información del grupo`
  String get groupAppBar {
    return Intl.message(
      'Información del grupo',
      name: 'groupAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Información del grupo de la cuenta`
  String get groupInfo {
    return Intl.message(
      'Información del grupo de la cuenta',
      name: 'groupInfo',
      desc: '',
      args: [],
    );
  }

  /// `Nombre del grupo`
  String get groupName {
    return Intl.message(
      'Nombre del grupo',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `Descripción`
  String get groupDescription {
    return Intl.message(
      'Descripción',
      name: 'groupDescription',
      desc: '',
      args: [],
    );
  }

  /// `Últimas vistas`
  String get lastVisitedAppBar {
    return Intl.message(
      'Últimas vistas',
      name: 'lastVisitedAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Información del calendario`
  String get scheduleInformation {
    return Intl.message(
      'Información del calendario',
      name: 'scheduleInformation',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de inicio`
  String get scheduleStartDate {
    return Intl.message(
      'Fecha de inicio',
      name: 'scheduleStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de finalización`
  String get scheduleEndDate {
    return Intl.message(
      'Fecha de finalización',
      name: 'scheduleEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Días de la semana`
  String get scheduleWeekdays {
    return Intl.message(
      'Días de la semana',
      name: 'scheduleWeekdays',
      desc: '',
      args: [],
    );
  }

  /// `Hora de inicio`
  String get scheduleStartTime {
    return Intl.message(
      'Hora de inicio',
      name: 'scheduleStartTime',
      desc: '',
      args: [],
    );
  }

  /// `Hora de finalización`
  String get scheduleEndTime {
    return Intl.message(
      'Hora de finalización',
      name: 'scheduleEndTime',
      desc: '',
      args: [],
    );
  }

  /// `Información del usuario`
  String get informationAppBar {
    return Intl.message(
      'Información del usuario',
      name: 'informationAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Información de la cuenta del usuario`
  String get informationTitle {
    return Intl.message(
      'Información de la cuenta del usuario',
      name: 'informationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get informationName {
    return Intl.message(
      'Nombre',
      name: 'informationName',
      desc: '',
      args: [],
    );
  }

  /// `Credenciales`
  String get informationCredentials {
    return Intl.message(
      'Credenciales',
      name: 'informationCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Grupo`
  String get informationGroup {
    return Intl.message(
      'Grupo',
      name: 'informationGroup',
      desc: '',
      args: [],
    );
  }

  /// `Edificio no bloqueable`
  String get alertTypeNonFullLockable {
    return Intl.message(
      'Edificio no bloqueable',
      name: 'alertTypeNonFullLockable',
      desc: '',
      args: [],
    );
  }

  /// `Area no accesible`
  String get alertTypeNoAccessible {
    return Intl.message(
      'Area no accesible',
      name: 'alertTypeNoAccessible',
      desc: '',
      args: [],
    );
  }

  /// `Area no bloqueable`
  String get alertTypeNoLockArea {
    return Intl.message(
      'Area no bloqueable',
      name: 'alertTypeNoLockArea',
      desc: '',
      args: [],
    );
  }

  /// `Acción inválida`
  String get alertTypeInvalid {
    return Intl.message(
      'Acción inválida',
      name: 'alertTypeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Acción errónea`
  String get alertTypeError {
    return Intl.message(
      'Acción errónea',
      name: 'alertTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Hay puertas abiertas. Cierra todas las puertas para bloquear todo el edificio.`
  String get alertScreenHomeButtonFullLockUnlock {
    return Intl.message(
      'Hay puertas abiertas. Cierra todas las puertas para bloquear todo el edificio.',
      name: 'alertScreenHomeButtonFullLockUnlock',
      desc: '',
      args: [],
    );
  }

  /// `No es possible acceder a dicha area, porque no hay puertas. \n Pónte en contacto con el administrador.`
  String get alertScreenHomeNoAccessibleArea {
    return Intl.message(
      'No es possible acceder a dicha area, porque no hay puertas. \n Pónte en contacto con el administrador.',
      name: 'alertScreenHomeNoAccessibleArea',
      desc: '',
      args: [],
    );
  }

  /// `Hay puertas abiertas. Cierra todas las puertas del área para bloquearla.`
  String get alertScreenHomeButtonLockArea {
    return Intl.message(
      'Hay puertas abiertas. Cierra todas las puertas del área para bloquearla.',
      name: 'alertScreenHomeButtonLockArea',
      desc: '',
      args: [],
    );
  }

  /// `no es possible bloquear todas las puertas del area, porque no dispone de puertas.`
  String get alertScreenHomeNoDoorsInArea {
    return Intl.message(
      'no es possible bloquear todas las puertas del area, porque no dispone de puertas.',
      name: 'alertScreenHomeNoDoorsInArea',
      desc: '',
      args: [],
    );
  }

  /// `Desbloquea la peurta para poder abrirla.`
  String get alertScreenDoorButtonOpenClose {
    return Intl.message(
      'Desbloquea la peurta para poder abrirla.',
      name: 'alertScreenDoorButtonOpenClose',
      desc: '',
      args: [],
    );
  }

  /// `Función no implementada. Se añadirá la función en una actualización futura.`
  String get alertScreenDoorButtonUnlockShortly {
    return Intl.message(
      'Función no implementada. Se añadirá la función en una actualización futura.',
      name: 'alertScreenDoorButtonUnlockShortly',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'DE'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
