import 'package:byte_bank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.green.shade900,
            secondary: Colors.blueAccent.shade700,
          ),
          buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent.shade700, textTheme: ButtonTextTheme.primary)),
      home: const Dashboard(),
    );
  }
}
