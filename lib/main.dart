import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'login.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),//home define el widget de la pantalla principal , establecemos a LoginPage()
      debugShowCheckedModeBanner: false,//quitamos la marca de agua DEBUG
    );
  }
}
