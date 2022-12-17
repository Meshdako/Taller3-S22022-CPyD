import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POKEDEX',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Autentificación con Correo UTEM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));   
            }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Image(
          image: AssetImage("lib/assets/images/Logo_UTEM.gif"),
        ));
  }
  /* Widget build(BuildContext context) {
    return const LoginScreen();
  } */
}
