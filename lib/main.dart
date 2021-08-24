import 'package:flutter/material.dart';
import 'package:login_manzana/pages/login_page.dart';
import 'package:login_manzana/pages/registro/registro_page1.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login La Manzana Verde',
      home: LoginPage()
    );
  }
}