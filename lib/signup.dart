import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  _signup createState() => _signup();
}

class _signup extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        appBar: AppBar(
          title: new Text('서강대 공지사항'),
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
              Spacer(flex:8),
              Text(
                '회원 가입',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              Spacer(flex:8),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  Container(
                    width: 200,
                    child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: '아이디',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.account_circle),
                        ),
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Id is required';
                          }
                        }),
                  ),
                  Spacer(flex: 2),
                  Container(
                    width: 100,
                    height: 40,
                    child: RaisedButton(
                      child: Text('중복체크',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
              Spacer(flex:1),
              Container(
                width: 330,
                child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '비밀번호',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    }),
              ),
              Spacer(flex:1),
              Container(
                width: 330,
                child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '비밀번호 확인',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    },
                ),
              ),
              Spacer(flex:1),
              Container(
                width: 330,
                child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '이메일 입력',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    }),
              ),
              Spacer(flex:8),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  Container(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      child: Text('가입',
                        style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.pop(context,'가입 완료!');
                      },
                    ),
                  ),
                  Spacer(flex: 2),
                  Container(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      child: Text('취소',
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
                  Spacer(flex: 2),
                ],
              ),
              Spacer(flex:12),
            ],
          ),
        ),
      ),
    );
  }
}
