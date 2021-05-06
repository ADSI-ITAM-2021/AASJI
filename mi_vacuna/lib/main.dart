//@dart=2.9

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() {
  //Aquí se corre el programa
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  //setupDialogUi();
  //setupBottomSheetUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Vacuna',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.blue,
        primaryColor: Color(0xFFFFF7DC),
        accentColor: Color(0xFF8D0A0A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xFFE5E5E5),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF9D0A0A),
        ),
      ),
      onGenerateRoute: StackedRouter(),
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
