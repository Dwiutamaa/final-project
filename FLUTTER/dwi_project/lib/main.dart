import 'package:flutter/material.dart';
import 'package:flutter_application_dwi/screen/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemesanan Hotel',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
