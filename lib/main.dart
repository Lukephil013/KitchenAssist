import 'package:flutter/material.dart';
import 'package:kitchen_assist/Pages/RecipePage.dart';
import 'package:kitchen_assist/Pages/ListPage.dart';
import 'package:kitchen_assist/Pages/FirestorePage.dart';

void main() => runApp(new KitchenAssist());

class KitchenAssist extends StatelessWidget {
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
  ListPage page1;
  FirestorePage page2;
  RecipePage page3;

  List<Widget> pages;
  Widget currentPage;

  @override

  void initState(){
    page1 = ListPage();
    page2 = FirestorePage();
    page3 = RecipePage();

    pages = [page1, page2, page3];
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
            title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              title: Text("Firebase")
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