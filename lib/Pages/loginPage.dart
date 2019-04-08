import 'package:kitchen_assist/Utils/loginPageHelper.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kitchen_assist/Pages/ListPage.dart';

class loginPage extends StatefulWidget{
  @override
  createState() => new loginPageState();
}

class loginPageState extends State<loginPage>{
  listPage page1;
  Widget currentPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                authService.googleSignIn();
              },
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Kitchen Assist Login'),
            )
          ]
        ),
      )
    );
  }
}