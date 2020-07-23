import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  _signup createState() => _signup();
}

class _signup extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: new Text('서강대 공지사항'),
        automaticallyImplyLeading: false, //뒤로가기 버튼 삭제
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
                fontSize: 30,
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
                  child: RaisedButton(
                    child: Text('  아이디\n 중복체크'),
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
                    child: Text('가입'),
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
                    child: Text('닫기'),
                    color: Colors.blue,
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
    );
  }
}
