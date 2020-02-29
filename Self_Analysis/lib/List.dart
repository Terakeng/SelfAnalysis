import 'package:flutter/material.dart';
import './main.dart';
import './result.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: new AppBar(title: new Text('List')),
        //ボディ部分が表示内容
        body:Column(children: <Widget>[
          Card(child: Text('ここにQuestionが表示される')),
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
        ],
        ),
        ]),
        );}}