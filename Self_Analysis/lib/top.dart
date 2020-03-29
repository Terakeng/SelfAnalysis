import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './question.dart';
import './question_list.dart';
import 'sign_in.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key key,@required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top'),
          leading: Container(),
        ),
        body: Column(children: <Widget>[
          Container(
            height: 350.0,
            width: double.infinity,
            color: Colors.black54,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            child: Center(
              child: Text('''Why?
            ～人生を豊かにする自己分析'''),
            ),
          ),
          Column(
            children: <Widget>[
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
                color: Colors.orange,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Start",
                    style: TextStyle(
                        fontSize: 20.0,
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
                        fontSize: 20.0,
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
                      builder: (BuildContext context) => SignInPage(),
                    ),
                  );
                },
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
