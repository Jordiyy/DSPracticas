import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:agile_access/generated/l10n.dart';

import 'screen_log_in.dart';

class AgileAccessColors {
  static const Color azul1 = Color.fromRGBO(41, 98, 255, 1);
  static const Color azul2 = Color.fromRGBO(163, 179, 255, 1);
  static const Color azul3 = Color.fromRGBO(90, 124, 255, 1);
  //static const Color azul2 = Color.fromRGBO(90, 124, 255, 1);
  //static const Color azul3 = Color.fromRGBO(163, 179, 255, 1);
  static const Color azul4 = Color.fromRGBO(224, 241, 241, 1);
  static const Color text = Colors.black;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
        ),
      ),
      home: ScreenSingUp(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
