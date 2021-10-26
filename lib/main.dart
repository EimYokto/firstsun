import 'package:firebase_core/firebase_core.dart';
import 'package:firstsun/screen/location.dart';
import 'package:firstsun/screen/image.dart';
import 'package:flutter/material.dart';

import 'package:firstsun/screen/video.dart';
import 'package:firstsun/index.dart';
import 'package:firstsun/screen/dashboard.dart';

import 'config/constant.dart';
import 'screen/firebaseregister.dart';
import 'screen/login.dart';

Future<void> main() async {
  //กำหนดค่าเริ่มต้น
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        'register': (context) => FirebaseRegister(),
        'dashboard': (context) => Dashboard(),
        "video": (context) => video(),
        "image": (context) => Images(),
        "location": (context) => location(),
      },
      home: Index(),
    );
  }
}
