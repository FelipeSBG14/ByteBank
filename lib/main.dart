import 'package:bytebank_final/database/app_database.dart';
import 'package:bytebank_final/screens/contact_form.dart';
import 'package:bytebank_final/screens/contact_list.dart';
import 'package:bytebank_final/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

void main() {
  runApp(const MyApp());
  save(Contact(0, 'alex', 1000)).then((id){
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green
        ).copyWith(
          secondary: Colors.green[900]
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[900]
        )
      ),
      home: Dashboard(),
    );
  }
}
