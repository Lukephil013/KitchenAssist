import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kitchen_assist/Utils/database_helper.dart';
import 'package:kitchen_assist/Model/food.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class listPage extends StatefulWidget{
  @override
  createState() => new listPageState();
}

class listPageState extends State<listPage> {
  List<Food> _foodItems = [];
  Food food;
  DatabaseHelper databaseHelper = DatabaseHelper();
  int count = 0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(_foodItems == null){
      _foodItems = List<Food>();
     // updateListView();
    }
    return Scaffold(
      body: Column(
          children: <Widget>[
            enterFoodItem(),
            buildFoodList(),
          ]
      ),
       backgroundColor: Theme.of(context).backgroundColor,
//      floatingActionButton: new FloatingActionButton(
//          tooltip: 'Add Item',
//          backgroundColor: Colors.black,
//          child: new Icon(Icons.add)
//      ),
    );
  }

  TextEditingController _controller = new TextEditingController();

  void _addFoodItem(Food item) {
      setState(() => _foodItems.add(item)); //adding food item to array. get it to display name
  }

  Widget buildFoodList() {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _foodItems.length) {
            return buildFoodItem(_foodItems[index].title);
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
            var foodObj = new Food(_controller.value.text);
            _addFoodItem(foodObj);
            _save(foodObj);
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


  void _save(Food food) async{
    int result;
    food.date = DateFormat.yMMMd().format(DateTime.now());
    if(food.id != null){
      result = await databaseHelper.updateFood(food);
      print(food.id);
    }
      else{
      result = await databaseHelper.insertFood(food);
      print(food.title);
    }
    if(result != 0){
      _showAlertDialog('Status', 'Item Saved Successfully');
    }
    else{
      _showAlertDialog('Status', 'Problem saving item.');
    }
  }

  void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Food>> foodListFuture = databaseHelper.getFoodList();
      foodListFuture.then((_foodItems){
        setState(() {
          this._foodItems = _foodItems;
          this.count = _foodItems.length;
        });
      });
    });
  }
}