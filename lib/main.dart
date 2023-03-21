// ignore_for_file: use_build_context_synchronously

import 'package:bms/Utils/app_theme.dart';
import 'package:bms/login.dart';
import 'package:bms/service/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.light,
      // theme: ThemeData(
      //     primaryColor: Colors.deepOrangeAccent.shade200, fontFamily: "Ubuntu"),
      home: UserManagemnt().handleAuth(),
    );
  }
}






