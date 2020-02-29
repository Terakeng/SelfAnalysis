import 'package:flutter/material.dart';
import './main.dart';
import './result.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('Question!')),
        //ボディ部分が表示内容
        body:Column(children: <Widget>[
          Text('Why?'),
          TextField(
            keyboardType: TextInputType.text,),
          Text('なのか'),
          Text('↓'),
          TextField(
            keyboardType: TextInputType.text,),
          Text('だから'),
          Center(
            child: Text('Next')),
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
               Navigator.push(
                   context,
                   new MaterialPageRoute(
                       builder: (BuildContext context) =>
                          new ResultPage()));
                },
             color: Colors.orange,
             child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Finish!",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ))),
        ],
        ),
        ]),
        );
        }
        }