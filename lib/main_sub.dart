import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class Sub {
  final String title;
  final String url;
  final String boardName;

  Sub({
    this.title,
    this.url,
    this.boardName,

  });

  factory Sub.fromJSON(Map<String, dynamic> json) {
    return Sub(
      title: json['title'],
      url: json['url'],
      boardName: json['boardName'],

    );
  }
}


class SubPage extends StatefulWidget {
  final Get get;
  SubPage({Key key, this.get}) : super(key:key);
  _SubPage createState() => _SubPage(get);
}

class _SubPage extends State<SubPage> {
  List<Sub> _boardGet = [];
  String apiNumber = '';

  // main.dart api
  Get get;
  _SubPage(this.get);


  void _fetchSubs() async {
    final get = await http.get('http://ec2-3-34-73-23.ap-northeast-2.compute.amazonaws.com:8080/api/v1/notices/' + apiNumber);

    final List<Sub> parsedSub = jsonDecode(get.body)
        .map<Sub>((json) => Sub.fromJSON(json))
        .toList();
    setState(() {
      _boardGet.clear();
      _boardGet.addAll(parsedSub);

    });
  }


  Widget build(BuildContext context) {
    final Get board = ModalRoute.of(context).settings.arguments;

    if(board.name == '일반공지'){
      apiNumber = '?boardId=1';
      _fetchSubs();
    }else if(board.name == '학사공지'){
      apiNumber = '?boardId=2';
      _fetchSubs();
    }else if(board.name == '종합봉사실공지'){
      apiNumber = '?boardId=3';
      _fetchSubs();
    }else if(board.name == '행사특강'){
      apiNumber = '?boardId=4';
      _fetchSubs();
    }

    return Scaffold(
      appBar: AppBar(
          title: new Text(board.name),
          leading: IconButton(
            //왼쪽 상단 back button 직접 구현
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    board.name + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),

                    ),
                    child: ListView.builder(
                      itemCount: this._boardGet.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Center(
                            child: Container(
                              width: 370,
                              height: 65,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  child:Text(
                                    _boardGet[index].title,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: (){
                                    _boardGet[index].url;
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
