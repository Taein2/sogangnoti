import 'package:flutter/material.dart';

class SubPage extends StatefulWidget {
  _SubPage createState() => _SubPage();
}

class _SubPage extends State<SubPage> {
  var list = ['코로나19', '학사공지'];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text(list[1]),
          leading: IconButton(
            //왼쪽 상단 back button 직접 구현
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    list[1] +'\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                  Container(
                    width: 330,
                    height: 330,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),

                    ),
                    child: SingleChildScrollView(

                      child: Text('리스트 부분'),
                    ),
                  ),
                ],
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
