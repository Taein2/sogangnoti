
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class Post {
  int id;
  String name;

  Post({
    this.id,
    this.name,
  });

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
    );
  }
}


class MainPage0 extends StatefulWidget {
  _MainPage0 createState() => _MainPage0();
}


class _MainPage0 extends State<MainPage0> {
  List<Post> _posts = [];

  void _fetchPosts() async {
    final response = await http.get('http://ec2-3-34-73-23.ap-northeast-2.compute.amazonaws.com:8080/api/v1/sites');
    final List<Post> parsedResponse = jsonDecode(response.body).map<Post>((json) => Post.fromJSON(json)).toList();
    setState(() {
      _posts.clear();
      _posts.addAll(parsedResponse);

    });
  }

  void initState() {
    super.initState();
    _fetchPosts() ;

  }

  String _userId = 'user ID';
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: () async => false, //안드로이드 뒤로가기 방지
      child : Scaffold(
        appBar: AppBar(
          title: new Text('서강대 공지사항'),
          leading: IconButton(
            //왼쪽 상단 back button 직접 구현
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                        ' 님 환영합니다',
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
              ListTile(
                title: Text(
                  '구독 관리',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  '키워드 관리',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
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
                              '비밀번호변경',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              FocusManager.instance.primaryFocus
                                  .unfocus(); //백 버튼으로 돌아갈 시 포커스 해제
                              Navigator.of(context).pushNamed('/changepw');
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
                              FocusManager.instance.primaryFocus
                                  .unfocus(); //백 버튼으로 돌아갈 시 포커스 해제
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ListView.builder(
              itemCount: this._posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Center(
                    child: Container(
                      width: 370,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          color: Colors.blue,
                          child:Text(
                            _posts[index].name,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamed('/main', arguments: _posts[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
