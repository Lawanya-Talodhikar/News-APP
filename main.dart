import 'package:flutter/material.dart';
import 'package:techie/Utils/colors.dart';


import 'Pages/home.dart';
void main()=>runApp(new MyApp());
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Appcolors.primarycolor

      ),
      home: Home(),
    );
  }
}
