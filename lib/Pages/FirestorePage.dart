import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorePage extends StatefulWidget {
  @override
  createState() => new FirestorePageState();
}

class FirestorePageState extends State<FirestorePage> {
  @override
  Widget build(BuildContext context) {
    return _firestoreTest();
  }

  Widget _firestoreTest() {
    TextEditingController _controller = new TextEditingController();
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _controller,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(1.0),
              child: Text('Submit'),
              color: Theme.of(context).buttonColor,
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
          ],
        ),
        Padding(padding: EdgeInsets.all(16.0),),
        Flexible(
          child: StreamBuilder(
            stream: Firestore.instance.collection('Test').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Waiting...');
              return Text(snapshot.data.documents[0]['data']);
            },
          ),
        ),
      ],
    );
  }
}
