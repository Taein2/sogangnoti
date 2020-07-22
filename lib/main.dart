import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '서강대 공지사항',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sogang Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              'Sogang Noti',
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 330,
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle)),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'ID is required';
                  }
                },
              ),
            ),
            Container(
              width: 330,
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Password is required';
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                Spacer(flex: 2),
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "로그인이 안되세요?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Spacer(flex: 8),
                GestureDetector(
                    onTap: () {},
                    child: Text("회원가입",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue))),
                Spacer(flex: 2)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 330,
                  child: RaisedButton(
                    child: Text('로그인',
                      style: TextStyle(
                        fontSize:15.0,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue,

                    onPressed: () {

                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
