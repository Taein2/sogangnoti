import 'package:flutter/material.dart';

class ChangePwPage extends StatefulWidget {
  _ChangePW createState() => _ChangePW();
}

class _ChangePW extends State<ChangePwPage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,     //안드로이드 뒤로가기 방지
      child: new Scaffold(
        appBar: AppBar(
            title: new Text('서강대 공지사항 - 패스워드 찾기'),
            leading:
            IconButton(         //왼쪽 상단 back button 직접 구현
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            )
        ),
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Column(
            children: <Widget>[
              Spacer(flex: 6),
              Text(
                '비밀번호 찾기',
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
                      hintText: 'Email',
                      contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.mail, size:35),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Email is required';
                      }
                    }),
              ),
              Spacer(flex: 1),
              Text(
                '가입시 입력한 이메일 주소를 입력하세요',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(flex: 7),
              Row(
                children: <Widget>[
                  Spacer(flex: 1),
                  Container(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      child: Text('찾기',
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
                                title: Text('비밀번호 찾기 결과'),
                                content: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('임시 비밀번호를 이메일로 보냈습니다!'),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 100,
                                        child: RaisedButton(
                                            child: Text('처음으로',
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.white,
                                                ),
                                            ),
                                            color: Colors.blue,
                                            onPressed: () {
                                              Navigator.popUntil(context,
                                                  ModalRoute.withName(Navigator.defaultRouteName));
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
                  Spacer(flex: 1),
                  Container(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      child:
                      Text( '취소',
                        style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                      color: Colors.blueGrey,
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
