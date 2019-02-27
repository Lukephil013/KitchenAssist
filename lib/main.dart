import 'package:flutter/material.dart';

void main() => runApp(new KitchenAssist());

class KitchenAssist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kitchen Assist',
      theme: ThemeData.light(),
      home: new FoodList(),
    );
  }
}

class FoodList extends StatefulWidget {
  @override
  createState() => new FoodListState();
}

class FoodListState extends State<FoodList> {
  List<String> _foodItems = [];
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

  /*This Widget contains the text form to enter in a new food item to the list*/
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
                fillColor: Theme.of(context).dialogBackgroundColor,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
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
          color: Theme.of(context).buttonColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: Theme.of(context).accentIconTheme,
        title: new Text('In-House Food'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: <Widget>[
          enterFoodItem(),
//          Padding(padding: EdgeInsets.all(16.0)),
          buildFoodList(),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
//      floatingActionButton: new FloatingActionButton(
//          onPressed: _pushItemFoodScreen,
//          tooltip: 'Add Item',
//          backgroundColor: Colors.black,
//          child: new Icon(Icons.add)),
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
}
