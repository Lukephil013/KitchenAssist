import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:kitchen_assist/Pages/RecipePage.dart';
import 'package:kitchen_assist/Pages/ListPage.dart';

void main() => runApp(new KitchenAssist());

class KitchenAssist extends StatelessWidget {
//code written to sign in

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

Future<FirebaseUser> _signIn() async{
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

  FirebaseUser user = await _auth.signInWithGoogle(
    idToken: gSA.idToken, accessToken: gSA.accessToken);
  print("User Name : ${user.displayName}");
  return user;
}

void _signOut(){
  googleSignIn.signOut();
  print("User Signed out");
}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kitchen Assist',
      theme: ThemeData.light(),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  /*This Widget contains the text form to enter in a new food item to the list*/
  int currentTab = 0;
  listPage page1;
  recipePage page2;
  List<Widget> pages;
  Widget currentPage;

  @override

  void initState(){
    page1 = listPage();
    page2 = recipePage();

    pages = [page1, page2];
    currentPage = page1;
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: Theme.of(context).accentIconTheme,
        title: new Text('In-House Food'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap:(int index){
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Settings")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text("Recipes"),
          ),
        ]
      ),
    );
  }
}