import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/UI/Controller/controller.dart';
import 'package:language_translator/UI/Home.dart';

void main() {
  Get.put(LanguageHandler());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Home()
    );
  }
}

