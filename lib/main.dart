import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;
  bool _checked4 = false;
  bool _checked5 = false;
  String _userId = 'user ID';


  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(_userId + ' 님 환영합니다'),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Spacer(),
                      Icon(Icons.account_circle, size: 50),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              child: Text('마이페이지'),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/mypage');
                              },
                              color: Colors.teal),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // 리스트타일 추가
            CheckboxListTile(
              title: Text('코로나19'),
              controlAffinity: ListTileControlAffinity.platform,
              value: _checked1,
              onChanged: (bool value) {
                setState(() {
                  _checked1 = value;
                });
              },
              checkColor: Colors.black,
            ),
            CheckboxListTile(
              title: Text('일반공지'),
              controlAffinity: ListTileControlAffinity.trailing,
              value: _checked2,
              onChanged: (bool value) {
                setState(() {
                  _checked2 = value;
                });
              },
              checkColor: Colors.black,
            ),
            CheckboxListTile(
              title: Text('학사공지'),
              controlAffinity: ListTileControlAffinity.platform,
              value: _checked3,
              onChanged: (bool value) {
                setState(() {
                  _checked3 = value;
                });
              },
              checkColor: Colors.black,
            ),
            CheckboxListTile(
              title: Text('장학공지'),
              controlAffinity: ListTileControlAffinity.platform,
              value: _checked4,
              onChanged: (bool value) {
                setState(() {
                  _checked4 = value;
                });
              },
              checkColor: Colors.black,
            ),
            CheckboxListTile(
              title: Text('행사특강'),
              controlAffinity: ListTileControlAffinity.platform,
              value: _checked5,
              onChanged: (bool value) {
                setState(() {
                  _checked5 = value;
                });
              },
              checkColor: Colors.black,
            ),
            Spacer(flex: 1),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 270,
                    child: RaisedButton(
                      child: Text('로그 아웃'),
                      onPressed: () {
                        Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: new Text('서강대 공지사항'),
      ),
      body: Column(
        children: <Widget>[
          //sliverappbar 내부구성

        ],
      ),
    );
  }
}
