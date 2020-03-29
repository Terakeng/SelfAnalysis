import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './result.dart';
import 'top.dart';

class FormData {
  String question = "";
  String answer = "";
  String index = "";
  bool fav = false;
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String id;
  final db = Firestore.instance;
  final formKey = GlobalKey<FormState>();
  FormData data = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question'),
        leading: Container(),
      ),
      body: Column(
        children: <Widget>[
          Text('Why?'),
          Form(
            key: formKey,
            child: createQuestionFormField(),
          ),
          Text('なのか'),
          Text('↓'),
          Form(
            key: formKey,
            child: createAnswerFormField(),
          ),
          RaisedButton(
              color: Colors.orange,
              child: Text(
                "Finish!",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto"),
              ),
              onPressed: () {
                createData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ResultPage()),
                );
              }),
          StreamBuilder<QuerySnapshot>(
            stream: db.collection('qustion').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: snapshot.data.documents
                        .map((doc) => buildItem(doc))
                        .toList());
              } else {
                return SizedBox();
              }
            },
          ),//StreamBuilderは編集を行う処理のため、ListPageに移行予定
        ],
      ),
    );
  }

  Card buildItem(DocumentSnapshot doc) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'question: ${doc.data['question']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'answer: ${doc.data['answer']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'index: ${doc.data['index']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'created_at: ${doc.data['created_at']}',
              style: TextStyle(fontSize: 24),
            ),
          ]),
    ));//このCard部分はListPageへ移行予定
  }

  Widget createQuestionFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Question?',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      onSaved: (value) {
        data.question = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return '質問を記入してください。';
        }
        return null;
      },
    );
  }

  Widget createAnswerFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Answer?',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      onSaved: (value) {
        data.answer = value;
        data.index = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return '回答を記入してください。';
        }
        return null;
      },
    );
  }

  void createData() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      DocumentReference ref = await db.collection('qustion').add({
        'answer': data.answer,
        'index': data.index,
        'fav': data.fav,
        'created_at': DateTime.now(),
      });
      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }

  void readDate() async {
    DocumentSnapshot snapshot =
        await db.collection('question').document(id).get();
    print(snapshot.data['name']);
  }
}
