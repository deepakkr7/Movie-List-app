import 'package:flutter/material.dart';
import 'package:movie_list/screens/companyinfo_page.dart';
import 'package:movie_list/screens/home_page.dart';
import 'package:movie_list/screens/login_page.dart';
import 'package:movie_list/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/company':(context)=>CompanyInfoPage(),
      },
    );
  }
}

