import 'package:flutter/material.dart';
import './top.dart';
import './create_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Why?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(title: new Text('TOP')),
      body:Column(children: <Widget>[
        Text('User Name'),
        TextField(
          keyboardType: TextInputType.text,),
        Text('Password'),
        TextField(
          keyboardType: TextInputType.text,),
        Row(children: <Widget>[
          FlatButton(
            key: null,
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new CreateUserPage()));
            },
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Create User",
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
                          new TopPage()));
            },
            color: Colors.orange,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Login",
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
