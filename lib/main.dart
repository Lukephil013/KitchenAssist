import 'package:flutter/material.dart';
import 'package:kitchen_assist/Pages/RecipePage.dart';
import 'package:kitchen_assist/Pages/ListPage.dart';
import 'package:kitchen_assist/Pages/loginPage.dart';
import 'root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kitchen_assist/auth.dart';
import 'package:kitchen_assist/authprovider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Kitchen Assist Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
    );
  }
}