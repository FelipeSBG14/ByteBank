import 'package:bytebank_final/http/weblient.dart';
import 'package:bytebank_final/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  findAll().then(
    (transactions) => print('New transactions ${transactions}'),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.green[900]),
          buttonTheme: ButtonThemeData(buttonColor: Colors.green[900])),
      home: Dashboard(),
    );
  }
}
