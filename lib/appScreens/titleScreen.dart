import 'package:flutter/material.dart';

class titleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.lightGreen,
          child: Row(
            children: <Widget>[
              Expanded(child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a food item.',
                )
              )),
              addFoodButton(),
              ],
          ),
      ),

    );
  }
}

class addFoodButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child:RaisedButton(
          color: Colors.deepOrange,
          child: Text("Submit"),
          elevation: 6.0,
          onPressed: null),
    );
  }
}