import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:sogang/main.dart";
import "package:sogang/main0.dart";
import 'package:sogang/mypage.dart';
import "package:sogang/signup.dart";
import "package:sogang/changpw.dart";
import "package:sogang/main_sub.dart";
import "package:sogang/mypage_changpw.dart";

//import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //???

      //페이지 연결 라우팅 형식
      initialRoute: '/',
      routes: {
        '/': (context) => new LoginPage(),
        '/main0': (context) => new MainPage0(),
        '/main': (context) => new MainPage(),
        '/signup': (context) => new SignupPage(),
        '/changepw': (context) => new ChangePwPage(),
        '/mypage': (context) => new Mypage(),
        '/sub' : (context) => new SubPage(),
        '/mypagechangepw' : (context) => new MyPageChangePwPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime backBtnpressedTime; //초기화

  var _controlID = TextEditingController();
  var _controlPW = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,

      child: Scaffold(
        appBar: AppBar(
          title: Text('서강대 공지사항'),
        ),
        resizeToAvoidBottomPadding: false,
        body: Center(
            child: Column(
              children: <Widget>[
                Spacer(flex: 4),
                Text(
                  'Sogang Noti',
                  style: TextStyle(fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                Spacer(flex: 4),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _controlID,
                    decoration: const InputDecoration(
                        hintText: '아이디를 입력하세요',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        prefixIcon: Icon(Icons.account_circle, size: 35)),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'ID is required';
                      }
                    },
                  ),
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _controlPW,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '비밀번호를 입력하세요',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.vpn_key, size: 35),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    },
                  ),
                ),
                Spacer(flex: 1),
                Row(
                  children: <Widget>[
                    Spacer(flex: 2),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                          Navigator.of(context).pushNamed('/changepw');
                        },
                        child: Text(
                          "로그인이 안되세요?",
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                    ),
                    Spacer(flex: 8),
                    GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text("회원가입",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.blue))),
                    Spacer(flex: 2)
                  ],
                ),
                Spacer(flex: 6),
                Column(
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: RaisedButton(
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            _controlID.text="";
                            _controlPW.text="";

                            FocusManager.instance.primaryFocus.unfocus();   //백 버튼으로 돌아갈 시 포커스 해제
                            Navigator.of(context).pushNamed('/main0');

                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 5),
              ],
            ),
          ),
        ),

    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backBtnpressedTime == null ||
        currentTime.difference(backBtnpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backBtnpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: '3초이내 한번더 누르면 앱이 종료됩니다.',
          backgroundColor: Colors.black,
          textColor: Colors.white);
          return false;
    }
    return true;
  }
}
