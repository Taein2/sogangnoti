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
                          Icon(
                              Icons.account_circle,
                              size:50
                          ),
                          Text(''),
                        ],
                      ),
                    )
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // 리스트타일 추가
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // 네이게이터 팝을 통해 드로워를 닫는다.
                Navigator.pop(context);
              },
            ),
            // 리스트타일 추가
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // 드로워를 닫음
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: new Text('서강대 공지사항'),
      ),
      body: Center(),
    );
  }
}
