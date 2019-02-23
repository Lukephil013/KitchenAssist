import 'package:flutter/material.dart';
import 'package:kitchen_assist/appScreens/titleScreen.dart';

void main(){
  runApp(
      MaterialApp(
        title: "Kitchen Assist",
        home: FoodList(),
    )
  );
}

class FoodList extends StatefulWidget{
  @override
    FoodListState createState() => FoodListState();
  }

class FoodListState extends State<FoodList>{
  int value = 2;
  _addItem() {
    setState(() {
      value = value + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
      ),
      body: ListView.builder(
          itemCount: this.value,
          itemBuilder: (context, index) => this._buildRow(index)),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }


  _buildRow(int index){
    return Text("Item " + index.toString());
  }
}

//Widget getListView(){
//  var listView = ListView(
//    children: <Widget>[
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View!"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ],
//  );
//  return listView;
//}
//
//Widget foodInputTxtField = TextField(
//  decoration: InputDecoration(
//    border: InputBorder.none,
//    hintText: 'Enter food item.'
//  ),
//);
//


//class FoodListState extends State<FoodList>{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("In-Home Food Items"),
//      ),
//      body: getListView(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){
//        },
//        child: Icon(Icons.fastfood),
//        backgroundColor: Colors.lightGreen,
//        foregroundColor: Colors.black,
//        tooltip: 'Add Item to Food List',
//      ),
//    );
//  }
//}