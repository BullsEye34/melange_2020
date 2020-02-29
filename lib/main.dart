import 'package:flutter/material.dart';
import 'package:melange_2020/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Events.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(app());
}

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xffFF7700),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffffffff)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading"),
              );
            } else {
              if (snapshot.hasData) {
                return events();
              } else {
                return login();
              }
            }
          },
        ),
      ),
    );
  }
}
