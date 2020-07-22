import 'package:flutter/material.dart';

class ChangePwPage extends StatefulWidget {
  _ChangePW createState() => _ChangePW();
}

class _ChangePW extends State<ChangePwPage> {
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
            Spacer(flex: 6),
            Text(
              '비밀번호 찾기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Spacer(flex: 4),
            Container(
              width: 330,
              child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.mail),
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
                fontSize: 15,
              ),
            ),
            Spacer(flex: 7),
            Row(
              children: <Widget>[
                Spacer(flex: 1),
                Container(
                  width: 150,
                  child: RaisedButton(
                    child: Text('찾기'),
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
                                  Text('비밀번호를 이메일로 보냈습니다!'),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: RaisedButton(
                                        child: Text('닫기'),
                                        color: Colors.blue,
                                        onPressed: () {
                                          Navigator.popUntil(context,
                                              ModalRoute.withName(Navigator.defaultRouteName));
                                        }),
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
                  child: RaisedButton(
                    child: Text('닫기'),
                    color: Colors.blue,
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
    );
  }
}
