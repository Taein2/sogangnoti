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
    return new WillPopScope(
      onWillPop: () async => false, //안드로이드 뒤로가기 방지
      child: new Scaffold(
        appBar: AppBar(
            title: new Text('서강대 공지사항'),
            leading: IconButton(
              //왼쪽 상단 back button 직접 구현
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        resizeToAvoidBottomPadding: false,
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                child: DrawerHeader(
                  child: Row(
                    children: <Widget>[
                      Text(
                        _userId + ' 님 환영합니다',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              // 리스트타일 추가
              SwitchListTile(
                title: Text(
                  '코로나19',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                value: _checked1,
                onChanged: (bool value) {
                  setState(() {
                    _checked1 = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  '일반공지',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                value: _checked2,
                onChanged: (bool value) {
                  setState(() {
                    _checked2 = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  '학사공지',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                value: _checked3,
                onChanged: (bool value) {
                  setState(() {
                    _checked3 = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  '장학공지',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                value: _checked4,
                onChanged: (bool value) {
                  setState(() {
                    _checked4 = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  '행사특강',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                value: _checked5,
                onChanged: (bool value) {
                  setState(() {
                    _checked5 = value;
                  });
                },
              ),
              Spacer(flex: 1),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 270,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: RaisedButton(
                            child: Text(
                              '마이페이지',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/mypage');
                            },
                            color: Colors.blue),
                      ),
                    ),
                    Container(
                      width: 270,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: RaisedButton(
                            child: Text(
                              '로그 아웃',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                            },
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Spacer(flex: 1),
              Text(
                '공지 사항',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/sub');
                },
              ),
              Spacer(flex:1),

          ],
          ),
        ),
      ),
    );
  }
}
