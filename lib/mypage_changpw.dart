import 'package:flutter/material.dart';

class MyPageChangePwPage extends StatefulWidget {
  _myPChangePW createState() => _myPChangePW();
}

class _myPChangePW extends State<MyPageChangePwPage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false, //안드로이드 뒤로가기 방지
      child: new Scaffold(
        appBar: AppBar(
            title: new Text('서강대 공지사항-비밀번호 변경'),
            leading: IconButton(
              //왼쪽 상단 back button 직접 구현
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                FocusManager.instance.primaryFocus.unfocus();   //백 버튼으로 돌아갈 시 포커스 해제
                Navigator.pop(context);
              },
            )),
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Column(
            children: <Widget>[
              Spacer(flex: 6),
              Text(
                '비밀번호 변경',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              Spacer(flex: 4),
              Container(
                width: 330,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: '현재 비밀번호',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.vpn_key, size: 35),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Email is required';
                    }
                  },
                ),
              ),
              Spacer(flex: 1),
              Container(
                width: 330,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: '새로운 비밀번호',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.vpn_key, size: 35),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Email is required';
                    }
                  },
                ),
              ),
              Spacer(flex: 1),
              Container(
                width: 330,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: '비밀번호 확인',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.vpn_key, size: 35),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Email is required';
                    }
                  },
                ),
              ),

              Spacer(flex: 7),
              Row(
                children: <Widget>[
                  Spacer(flex: 1),
                  Container(
                    width: 150,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        child: Text(
                          '변경',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('비밀번호 변경 결과'),
                                  content: new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('변경에 성공하였습니다!'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 100,
                                          child: RaisedButton(
                                              child: Text(
                                                '닫기',
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              color: Colors.blue,
                                              onPressed: () {
                                                FocusManager.instance.primaryFocus.unfocus();   //백 버튼으로 돌아갈 시 포커스 해제
                                                Navigator.pop(context);
                                                FocusManager.instance.primaryFocus.unfocus();   //백 버튼으로 돌아갈 시 포커스 해제
                                                Navigator.pop(context);
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Container(
                    width: 150,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        child: Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blueGrey,
                        onPressed: () {
                          FocusManager.instance.primaryFocus.unfocus();   //백 버튼으로 돌아갈 시 포커스 해제
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
              Spacer(flex: 7),
            ],
          ),
        ),
      ),
    );
  }
}
