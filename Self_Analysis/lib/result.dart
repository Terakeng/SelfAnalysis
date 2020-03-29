import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'top.dart';
import './question.dart';
import './question_list.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key key,@required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        leading: Container(),
      ),
      body: Column(children: <Widget>[
        Row(
          children: <Widget>[
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
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
              ),
            ),
            FlatButton(
              key: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => QuestionPage(),
                  ),
                );
              },
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "やり直す",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
              ),
            ),
            FlatButton(
              key: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ListPage(),
                  ),
                );
              },
              color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "List",
                  style: TextStyle(
                      fontSize: 16.0,
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
