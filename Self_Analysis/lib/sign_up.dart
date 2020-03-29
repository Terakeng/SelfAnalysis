import 'package:flutter/material.dart';
import 'sign_in.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サインアップ'),
        leading: Container(),
      ),
      //ボディ部分が表示内容
      body: Column(children: <Widget>[
        Text('User Name'),
        TextField(
          keyboardType: TextInputType.text,
        ),
        Text('Password'),
        TextField(
          keyboardType: TextInputType.text,
        ),
        Row(
          children: <Widget>[
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
              color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 20.0,
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
