import 'package:flutter/material.dart';
import './main.dart';
import './question.dart';
import './List.dart';



class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('TOP')),
        //ボディ部分が表示内容
        body:Column(children: <Widget>[ 
         Container(
          height: 100.0,
          width: double.infinity,
          color: Colors.black54,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
            '''Why?
            ～人生を豊かにする自己分析'''),),),
         Column(children: <Widget>[
          FlatButton(
            key: null,
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new QuestionPage()));
            },
            color: Colors.orange,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
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
         FlatButton(
            key: null,
            onPressed: () {
              Navigator.pop(context,);
            },
            color: Colors.red,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ))), 
        ],
        ),
        ]),
        );}}