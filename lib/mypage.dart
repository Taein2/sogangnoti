import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  _mypage createState() => _mypage();
}

class _mypage extends State<Mypage> {
  @override
  String _userId = 'userID';
  String _email = 'userEmail';

  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false, //안드로이드 뒤로가기 방지
      child: new Scaffold(
        appBar: AppBar(
            title: new Text('서강대 공지사항 - 마이페이지'),
            leading: IconButton(
              //왼쪽 상단 back button 직접 구현
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        resizeToAvoidBottomPadding: false,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Spacer(flex: 5),
                Text(
                  '마이페이지',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Spacer(flex: 4),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    _userId + ' 님 안녕하세요',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    '이메일 주소 : ' + _email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(flex: 4),
                Container(
                  width: 380,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      child: Text(
                        '비밀번호 변경',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {

                        Navigator.of(context).pushNamed('/mypagechangepw');
                      },
                    ),
                  ),
                ),
                Spacer(flex: 5),
                Text(
                  '추가한 키워드',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Spacer(flex: 5),
                Text(''),
                Container(
                    width: 330,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),

                    ),
                    child: SingleChildScrollView(

                      child: Text('키워드 추가할 부분'),
                    ),
                ),
                // List 추가 , #해시태그 가로 표시 ex) #안녕 #학사 #공지
                Spacer(flex: 3),

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}
