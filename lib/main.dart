import 'package:firstsun/screen/location.dart';
import 'package:firstsun/screen/image.dart';
import 'package:flutter/material.dart';

import 'package:firstsun/screen/video.dart';
import 'package:firstsun/index.dart';
import 'package:firstsun/screen/dashboard.dart';
import 'package:firstsun/screen/register.dart';

import 'config/constant.dart';
import 'screen/login.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMUTNB',
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
        primarySwatch: Colors.orange,
      ),
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
        'dashboard': (context) => Dashboard(),
        "video": (context) => video(),
        "image": (context) => Images(),
        "location": (context) => location(),
      },
      home: Index(),
    );
  }
}
