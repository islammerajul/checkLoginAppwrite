import 'package:chips_practice/screens/home_screen.dart';
import 'package:chips_practice/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:appwrite/appwrite.dart';

Client client = Client();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  client
      .setEndpoint('http://localhost/v1')
      .setProject('641bed0c00e0c9af1b66')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
