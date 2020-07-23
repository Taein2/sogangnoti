import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  _signup createState() => _signup();
}

class _signup extends State<SignupPage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        appBar: AppBar(
            title: new Text('서강대 공지사항'),
            leading: IconButton(
              //왼쪽 상단 back button 직접 구현
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Column(
            children: <Widget>[
              Spacer(flex: 5),
              Text(
                '회원 가입',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              Spacer(flex: 4),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  Container(
                    width: 210,
                    child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: '아이디',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.account_circle),
                        ),
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Id is required';
                          }
                        }),
                  ),
                  Spacer(flex: 1),
                  Container(
                    width: 100,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        child: Text(
                          '중복체크',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
              Spacer(flex: 1),
              Container(
                width: 330,
                child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '비밀번호',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    }),
              ),
              Spacer(flex: 1),
              Container(
                width: 330,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '비밀번호 확인',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.vpn_key),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Password is required';
                    }
                  },
                ),
              ),
              Spacer(flex: 1),
              Container(
                width: 330,
                child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '이메일 입력',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                    }),
              ),
              Spacer(flex: 3),
              Container(
                height: 100,
                width: 330,
                child: SingleChildScrollView(
                  child: Text(
                      '1. 개인정보의 처리 목적 <김태인> 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.\n'
                      '- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등\n'
                      '2. 개인정보의 처리 및 보유 기간\n'
                      ' ① <김태인> 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.\n'
                      ' ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.\n'
                      ' ☞ 아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.\n'
                      '  (예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지\n'
                      '- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년\n'
                      '    3. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.\n'
                      '① 정보주체는 김태인(‘김태인’이하 ‘김태인) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.\n'
                      '1. 개인정보 열람요구\n'
                      '2. 오류 등이 있을 경우 정정 요구\n'
                      '3. 삭제요구\n'
                      '4. 처리정지 요구\n'
                      ' 4. 처리하는 개인정보의 항목 작성\n'
                      '  ① <김태인>은(는) 다음의 개인정보 항목을 처리하고 있습니다.\n'
                      '5. 개인정보의 파기<김태인>은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.\n'
                      ' -파기절차\n'
                      '  이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.\n'
                      ' -파기기한\n'
                      '이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.\n'
                      '6. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항\n'
                      '   김태인 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.\n'
                      '7. 개인정보 보호책임자 작성\n'
                      ' ① 김태인 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n'
                      '▶ 개인정보 보호책임자\n'
                      '성명 :김태인\n'
                      '연락처 :010-3041-3039, dls102s@gmail.com,\n'
                      '    ※ 개인정보 보호 책임자로 연결됩니다.\n'
                      '8. 개인정보 처리방침 변경\n'
                      ' ①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.\n'
                      '9. 개인정보의 안전성 확보 조치 <김태인>은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.\n'
                      ' 1. 개인정보 취급 직원의 최소화 및 교육\n'
                      '개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.\n'
                  ),
                ),
              ),
              Spacer(flex: 1),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  Text('개인정보 처리 방침에 동의하시겠습니까?'),
                  Checkbox(
                    value: _checked,
                    onChanged: (bool newValue) {
                      setState(() {
                        _checked = newValue;
                      });
                    },
                    checkColor: Colors.black,
                  ),
                  Spacer(flex: 2),
                ],
              ),
              Spacer(flex: 1),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  Container(
                    width: 150,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        child: Text(
                          '가입',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context, '가입 완료!');
                        },
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                  Container(
                    width: 150,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        child: Text(
                          '취소',
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
                  ),
                  Spacer(flex: 2),
                ],
              ),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}
