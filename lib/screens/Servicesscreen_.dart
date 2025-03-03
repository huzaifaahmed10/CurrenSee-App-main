import 'dart:async';

import 'package:currencapp/screens/StartScreen.dart';
import 'package:flutter/material.dart';

class ServicesScreen {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const StartPage()));
    });
  }
}
