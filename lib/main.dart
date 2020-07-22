import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  // 드로워해더 추가
                  DrawerHeader(
                    child: Column(
                      children: <Widget>[
                        Text('User ID 님 환영합니다'),
                        Expanded(
                            child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Icon(Icons.account_circle, size: 50),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                      child: Text('마이페이지'),
                                      onPressed: () {},
                                      color: Colors.teal),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        )),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  // 리스트타일 추가
                  ListTile(
                    title: Text('버전정보'),
                    dense: true,
                  ),
                  ListTile(
                    title: Text('ver 0.0.0'),
                  )
                ],
              ),
            ),
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

        ],
      ),
    );
    
  }
}
