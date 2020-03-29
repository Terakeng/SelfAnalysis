import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './sign_up.dart';
import './top.dart';

final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サインイン'),
        leading: Container(),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Form(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'メールアドレスを入力してください。';
                        }
                      },
                      controller: emailInputController,
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'mailaddress',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: passwordInputController,
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: RaisedButton(
                        child: const Text('Login'),
                        onPressed: (signIn),
                      ),
                    ),
                  ],
                ),
              ),
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
                      builder: (BuildContext context) => SignUpPage(),
                    ),
                  );
                },
                color: Colors.white24,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "初めての方はこちら",
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
        ],
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TopPage(
                    user: user,
                  )),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}
