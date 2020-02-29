import 'package:flutter/material.dart';
import './main.dart';
import './question.dart';
import './List.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('Result!!')),
        //ボディ部分が表示内容
        body:Column(children: <Widget>[
        
          Row(children: <Widget>[
           FlatButton(
            key: null,
            onPressed: () {
              Navigator.pop(context,);
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
                ))),
           FlatButton(
            key: null,
            onPressed: () {
              Navigator.pop(context,);
            },
            color: Colors.red,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "やり直す",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ))),
          FlatButton(
            key: null,
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new ListPage()));
            },
            color: Colors.orange,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "List",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ))),
        ],
        ),
        ]),
        );}}