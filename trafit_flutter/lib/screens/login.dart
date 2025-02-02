import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:trafit/screens/main_screen.dart';
import 'package:trafit/util/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


=======
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_ui_kit/screens/Mbti_ei_screen.dart';
import 'package:restaurant_ui_kit/screens/main_screen.dart';
import 'package:restaurant_ui_kit/util/User.dart';
import 'package:restaurant_ui_kit/util/api_service.dart';
import 'dart:convert';


>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
ApiService apiService = new ApiService();
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _useridControl = new TextEditingController();
  final TextEditingController _passwordControl = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0,0,20,0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[

          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              "Log in to your account",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),

          SizedBox(height: 30.0),

          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "ID",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _useridControl,
              ),
            ),
          ),

          SizedBox(height: 10.0),

          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
                maxLines: 1,
                controller: _passwordControl,
              ),
            ),
          ),

          SizedBox(height: 10.0),

          Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                "비밀번호 찾기",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: (){},
            ),
          ),

          SizedBox(height: 30.0),

          Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                "로그인".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
<<<<<<< HEAD
              onPressed: () async {
                Map<String, dynamic> response = await apiService.login(_useridControl.text, _passwordControl.text);

                Fluttertoast.showToast(
                  msg: response['message'],
                  toastLength: Toast.LENGTH_LONG,
                );
                              
                if(response['code'] == 200){
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString('id', _useridControl.text);
                  sharedPreferences.setString('username', response['username']);
                  sharedPreferences.setString('mbti', response['mbti']);
                  sharedPreferences.setString('img', response['img']);
                  sharedPreferences.setString('room_num', response['room_num']);


                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
=======
              onPressed: () {

               // String abc = await apiService.login(_useridControl.text, _passwordControl.text);
                //String ttt = '{"id": "z1top123","email":"z1top123@naver.com"}';
                //Map<String, dynamic>map = jsonDecode(abc);
                /*user.add(
                  {
                    "id" : map['id'],
                    "email": map['email']
                  }
                );
                print(user[1]);
*/




                //로그인 버튼 클릭시 user_email, user_password 서버에 보내고 User 정보 받아온 뒤 User list에 저장
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      if(user[0]['mbti']==null)
                        return Mbti_ei("hello",0);
                      else
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
                        return MainScreen();
                    },
                  ),
                );
                }
                //로그인 버튼 클릭시 user_email, user_password 서버에 보내고 User 정보 받아온 뒤 User list에 저장
              },
              color: Theme.of(context).accentColor,
            ),
          ),

          SizedBox(height: 10.0),
          Divider(color: Theme.of(context).accentColor,),
          SizedBox(height: 10.0),


          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              child: Row(
                children: <Widget>[
                ],
              ),
            ),
          ),

          SizedBox(height: 20.0),

        ],
      ),
    );
  }
}