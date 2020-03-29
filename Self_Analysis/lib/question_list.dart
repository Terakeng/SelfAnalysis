import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './top.dart';
import './result.dart';

class FormData {
  String question = "";
  String answer = "";
  String index = "";
  bool fav = false;
}

class ListPage extends StatefulWidget {
  ListPage(this.document);
  final DocumentSnapshot document;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  DocumentReference mainReference =
      Firestore.instance.collection('user').document();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FormData data = FormData();
  bool isDataExist = false;

  @override
  void initState() {
    if (widget.document != null) {
      data.question = widget.document['quesution'];
      data.answer = widget.document['answer'];
      data.index = widget.document['index'];
      data.fav = widget.document['fav'];
      mainReference = Firestore.instance
          .collection('question')
          .document(widget.document.documentID);
      isDataExist = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        leading: Container(),
      ),
      body: Column(children: <Widget>[
        Column(
          children: <Widget>[
            FlatButton(
              key: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ResultPage(),
                  ),
                );
              },
              color: Colors.black,
              child: Card(
                child: Center(
                  child: Text(
                    "ここにクエスチョンがはいる→リザルトへ",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
            ),
            FlatButton(
              key: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TopPage(),
                  ),
                );
              },
              color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "TOPへ戻る",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
