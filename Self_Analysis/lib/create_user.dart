import 'package:flutter/material.dart';
import './main.dart';


class CreateUserPage extends StatefulWidget {
  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('Create User')),
        //ボディ部分が表示内容
        body:
        Column(children: <Widget>[
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
              Navigator.pop(context,);
            },
            color: Colors.blue,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Create",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ))),
        ],
        ),
        ]),
       bottomNavigationBar: BottomNavigationBar(
         items: [
          new BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text("Login"),
          ),
        ],
     ),
);}}