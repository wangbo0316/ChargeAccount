import 'package:flutter/material.dart';
import './Home/main.dart';
void main() => runApp(Entrance());


class Entrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(56, 56, 56, 1),
        backgroundColor: Color.fromRGBO(255, 251, 245, 1)
      ),
      home: Home(),
    );
  }
}
