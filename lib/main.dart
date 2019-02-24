import 'package:flutter/material.dart';

void main() => runApp(new KitchenAssist());

class KitchenAssist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kitchen Assist',
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

  void _addFoodItem(String item) {
    if (item.length > 0) {
      setState(() => _foodItems.add(item));
    }
  }

  Widget _buildFoodList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _foodItems.length) {
          return _buildFoodItem(_foodItems[index]);
        }
      },
    );
  }

  Widget _buildFoodItem(String item) {
    return new ListTile(title: new Text(item));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('In-House Food'),
            backgroundColor: new Color(0x673AB7),
      ),
      body: _buildFoodList(),
      backgroundColor: Colors.lightBlue[100],
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushItemFoodScreen,
          tooltip: 'Add Item',
          backgroundColor: Colors.black,
          child: new Icon(Icons.add)),
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
          backgroundColor: Colors.lightBlue[100]
      );
    }));
  }
}
