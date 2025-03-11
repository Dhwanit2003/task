import 'package:flutter/material.dart';
import 'DataScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DataScreen(),
    );
  }
}
