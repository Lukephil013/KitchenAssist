import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kitchen_assist/Models/Food.dart';
import 'package:kitchen_assist/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class listPage extends StatefulWidget{

  @override
  createState() => new listPageState();
}

class listPageState extends State<listPage> {
  List<String> _foodItems = [];

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Food> foodList;
  int count = 0;


  @override
  Widget build(BuildContext context) {
    if(foodList == null){
      foodList = List<Food>();
    }
    return Scaffold(
      body: Column(
          children: <Widget>[
            enterFoodItem(),
            buildFoodList(),
          ]
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: new FloatingActionButton(
          onPressed: (){/*_firestoreTest();*/},
          tooltip: 'Add Item',
          backgroundColor: Colors.black,
          child: new Icon(Icons.add)
      ),
    );
  }

  TextEditingController _controller = new TextEditingController();

  void _addFoodItem(String item) {
    if (item.length > 0) {
      setState(() => _foodItems.add(item));
    }
  }

  Widget buildFoodList() {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _foodItems.length) {
            return buildFoodItem(_foodItems[index]);
          }
        },
      ),
    );
  }

  Widget buildFoodItem(String item) {
    return ListTile(
      title: new Text(item),
      trailing: FlatButton(
        onPressed: () {
          setState(() {
            _foodItems.remove(item);
          });
        },
        child: Icon(Icons.clear),
      ),
    );
  }

  void _pushItemFoodScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Add a new item'),
            backgroundColor: new Color(0x673AB7),
          ),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addFoodItem(val);
              Navigator.pop(context);
            },
            decoration: new InputDecoration(
                hintText: 'Enter a food item...',
                contentPadding: const EdgeInsets.all(16.0)),
          ),
          backgroundColor: Colors.lightBlue[100]);
    }));
  }

  Widget enterFoodItem() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: _controller,
            autofocus: false,
            textCapitalization: TextCapitalization.sentences,
            decoration: new InputDecoration(
                fillColor: Theme
                    .of(context)
                    .dialogBackgroundColor,
                hintStyle: TextStyle(color: Theme
                    .of(context)
                    .hintColor),
                hintText: 'Enter a food item...',
                contentPadding: const EdgeInsets.all(16.0)),
          ),
        ),
        RaisedButton(
          onPressed: () {
            _addFoodItem(_controller.value.text);
            _controller.clear();
          },
          child: Text('Submit'),
          color: Theme
              .of(context)
              .buttonColor,
        ),
      ],
    );
  }
  void _insert(Food food) async{
    //int result = await databaseHelper.insertItem(food);
  }
}

//need to test database