import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main0.dart';


class Get {
  final String name;
  final String siteName;

  Get({
    this.name,
    this.siteName,

  });

  factory Get.fromJSON(Map<String, dynamic> json) {
    return Get(
      name: json['name'],
      siteName: json['siteName'],
    );
  }
}

class MainPage extends StatefulWidget {
  final Post post;
  MainPage({Key key, this.post}) : super(key:key);
  _MainPage createState() => _MainPage(post);

}

class _MainPage extends State<MainPage> {

  List<Get> _notiGet = [];

  Post post;
  _MainPage(this.post);

  String apiNumber = '';

  void _fetchGets() async {
    final get = await http.get('http://ec2-3-34-73-23.ap-northeast-2.compute.amazonaws.com:8080/api/v1/boards/' + apiNumber);

    final List<Get> parsedGet = jsonDecode(get.body)
        .map<Get>((json) => Get.fromJSON(json))
        .toList();
    setState(() {
      _notiGet.clear();
      _notiGet.addAll(parsedGet);

    });
  }
  void initState() {
    super.initState();
    _fetchGets();
  }


  Widget build(BuildContext context) {
    final Post args = ModalRoute.of(context).settings.arguments;

      if(args.id == 1){
        apiNumber = '?siteId=1';
        _fetchGets();
      }else if(args.id == 2){
        apiNumber = '?siteId=2';
        _fetchGets();
      }

    return new WillPopScope(
      onWillPop: () async => false, //안드로이드 뒤로가기 방지
      child: new Scaffold(

        appBar: AppBar(
            title: new Text(args.name),
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
            child: Column(
              children: <Widget>[
                Container(
                  width: 360,
                  height: 550,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: this._notiGet.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(
                          children: <Widget>[

                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/sub',arguments: _notiGet[index]);
                              },
                              color: Theme.of(context).accentColor,
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _notiGet[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 150,
                              child:Column(
                                children: <Widget>[
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                          return GestureDetector(
                                              child: Text('흐아'),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

}
