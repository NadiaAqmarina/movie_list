import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_list/pages/splash_screen.dart';
import 'package:flutter/services.dart';

void main() async {
  await dotenv.load();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Movie Scope',
    home: Splash(),
    builder: EasyLoading.init(),
  ));
}
