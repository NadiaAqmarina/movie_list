import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_list/pages/splash_screen.dart';

void main() async {
  await dotenv.load();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Movie Scope',
    home: Splash(),
    builder: EasyLoading.init(),
  ));
}
