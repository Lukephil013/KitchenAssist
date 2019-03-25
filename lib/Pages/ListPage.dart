import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class listPage extends StatefulWidget{
  @override
  createState() => new listPageState();
}

class listPageState extends State<listPage> {
  List<String> _foodItems = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

  /*void _firestoreTest() {
    TextEditingController _controller = new TextEditingController();

    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Firestore'),
          backgroundColor: Theme
              .of(context)
              .bottomAppBarColor,
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
            ),
            RaisedButton(
              padding: EdgeInsets.all(1.0),
              child: Text('Submit'),
              color: Theme
                  .of(context)
                  .buttonColor,
              onPressed: () {
                Firestore.instance
                    .collection('Test')
                    .document('5cK2LdvVfgmgM7EGQb6m')
                    .updateData({
                  'data': _controller.value.text,
                });
                _controller.clear();
              },
            ),
            StreamBuilder(
              stream: Firestore.instance.collection('Test').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Waiting...');
                return Text(snapshot.data.documents[0]['data']);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.clear),
        ),
      );
    }));
  }*/
}