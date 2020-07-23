import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  _mypage createState() => _mypage();
}

class _mypage extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('서강대 공지사항 - 마이페이지'),
        automaticallyImplyLeading: false, //뒤로가기 버튼 삭제
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '마이페이지',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            RaisedButton(
              child: Text('비밀번호 변경'),
              color: Colors.blue,
              onPressed: () {},
            ),
            Text(
              '추가한 키워드',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  heroTag: "Keyword add",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('키워드 추가'),
                            content: new Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: '키워드를 입력하세요',
                                    prefixIcon: Icon(Icons.account_circle),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Spacer(),
                                    Container(
                                      width: 100,
                                      child: RaisedButton(
                                          child: Text('추가'),
                                          color: Colors.blue,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 100,
                                      child: RaisedButton(
                                          child: Text('닫기'),
                                          color: Colors.blue,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
