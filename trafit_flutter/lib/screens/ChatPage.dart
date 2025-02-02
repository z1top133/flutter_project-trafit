<<<<<<< HEAD
import 'dart:async';
import 'package:trafit/util/mbti_result.dart';
import 'package:trafit/util/my_flutter_app_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trafit/screens/main_screen.dart';
import 'package:trafit/util/MyIP.dart';
import 'dart:convert';
import 'package:trafit/util/MySocket.dart';
import 'package:trafit/util/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trafit/util/travel_spots.dart';
import 'package:trafit/util/db_helper.dart';

List<Map<String, dynamic>> load;
SharedPreferences shared;
ApiService apiService = new ApiService();
Map<String, dynamic> chatInfo;
List<String> idList;
List<String> nameList;
List<String> mbtiList;
List<String> imgList;
List<String> tokenList;
String bossname;
String bossid;
String bossmbti;
String img;
String kickID;
bool hasData = false;
List comments;
final FirebaseMessaging _firebaseMessaging  = FirebaseMessaging();

Future<List> call(int num) async {
  String _token = await _firebaseMessaging.getToken();
  shared = await SharedPreferences.getInstance();
  load = await DBHelper().getMessage(num, shared.getString('id'));

  socketIO.sendMessage(
      'joinRoom',
      json.encode({
        'id': shared.getString('id'),
        'room': num,
        'mbti': shared.getString('mbti'),
        'img': shared.getString('img'),
        'username': shared.getString('username'),
        'token' : await _firebaseMessaging.getToken(),
        'type' : 'enter'
      }));
  chatInfo = await apiService.room_info(num);
  print(chatInfo);
  print(idList);
  return apiService.enter_room(
      num,
      shared.getString('id'),
      shared.getString('username'),
      shared.getString('mbti'),
      shared.getString('img'),
      _token);
}
=======
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'dart:convert';

import 'package:restaurant_ui_kit/util/api_service.dart';

const String _name = "username";
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23

// IOS용 테마
final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

// 기본 테마
final ThemeData kDefaultTheme = ThemeData(
<<<<<<< HEAD
  primarySwatch: Colors.white,
=======
  primarySwatch: Colors.purple,
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
  // 전송버튼에 적용할 색상으로 이용
  accentColor: Colors.orangeAccent[400],
);

<<<<<<< HEAD
class ChatPage extends StatefulWidget {
  final int num;
  final String category;

  ChatPage(this.num, this.category);

=======

class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'France',
      home: ChatScreen(),
      // defaultTargetPlatform을 사용하기 위해서는 foundation.dart 패키지의 추가 필요
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
    );
  }
}

class ChatScreen extends StatefulWidget {
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
  ChatScreenState createState() => ChatScreenState();
}

// 화면 구성용 상태 위젯. 애니메이션 효과를 위해 TickerProviderStateMixin를 가짐
<<<<<<< HEAD
class ChatScreenState extends State<ChatPage> with TickerProviderStateMixin {
  // 입력한 메시지를 저장하는 리스트
  final List<ChatMessage> _message = <ChatMessage>[];
  Future<List> userListF;

  // 텍스트필드 제어용 컨트롤러
  final TextEditingController _textController = TextEditingController();
=======
class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  SocketIO socketIO;
  // 입력한 메시지를 저장하는 리스트
  final List<ChatMessage> _message = <ChatMessage>[];

  // 텍스트필드 제어용 컨트롤러
  final TextEditingController _textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23

  // 텍스트필드에 입력된 데이터의 존재 여부
  bool _isComposing = false;

  @override
<<<<<<< HEAD
  void initState() {
    userListF = call(widget.num);
    /*for(int i=0;i<_message.length;i++){
      _message[i].animationController.forward();
    }*/
    socketIO.subscribe('receive_message', (jsonData) {
      //Convert the JSON data received into a Map
      Map<String, dynamic> data = json.decode(jsonData);
      // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
      ChatMessageR message = ChatMessageR(
        data: data,
=======
  void initState(){

    socketIO = SocketIOManager().createSocketIO(
      'https://trafit2186.herokuapp.com/',
      '/',
    );
    socketIO.init();
    socketIO.subscribe('receive_message', (jsonData) {

      //Convert the JSON data received into a Map
      Map<String, dynamic> data = json.decode(jsonData);
      String text = data['message'];
      debugPrint(text);
      // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
      ChatMessageR message = ChatMessageR(
        text: text,
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
        // animationController 항목에 애니메이션 효과 설정
        // ChatMessage은 UI를 가지는 위젯으로 새로운 message가 리스트뷰에 추가될 때
        // 발생할 애니메이션 효과를 위젯에 직접 부여함
        animationController: AnimationController(
          duration: Duration(milliseconds: 700),
          vsync: this,
        ),
      );
      // 리스트에 메시지 추가
      setState(() {
        _message.insert(0, message);
      });
      // 위젯의 애니메이션 효과 발생
      message.animationController.forward();
    });

<<<<<<< HEAD
    socketIO.subscribe('kickip_message', (jsonData) {
      socketIO.sendMessage('kicked',
          json.encode({'id': shared.getString('id'), 'room': 100000}));
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MainScreen();
          },
        ),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) => buildKickDialog(context));
    });
    
    socketIO.subscribe('kick_message1', (jsonData){
      Map<String, dynamic> data = json.decode(jsonData);
      idList.remove(data['id']);
      nameList.remove(data['username']);
      mbtiList.remove(data['mbti']);
      imgList.remove(data['img']);
      tokenList.remove(data['token']);
      hasData = true;
      KickMessage message = KickMessage(data: data, animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this
      ));

      setState(() {
        _message.insert(0, message);
      });
      message.animationController.forward();

    });

    socketIO.subscribe('receive_leave', (jsonData){
      Map<String, dynamic> data = json.decode(jsonData);
      idList.remove(data['id']);
      nameList.remove(data['username']);
      mbtiList.remove(data['mbti']);
      imgList.remove(data['img']);
      tokenList.remove(data['token']); 
      hasData=true;
      LeaveMessage message = LeaveMessage(data: data, animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this
      ));

      setState(() {
        _message.insert(0, message);
      });
      message.animationController.forward();
    });

    socketIO.subscribe('receive_join', (jsonData) {
      Map<String, dynamic> data = json.decode(jsonData);
      
      EnterMessage message = EnterMessage(data: data, animationController: AnimationController(
          duration: Duration(milliseconds: 700),
          vsync: this,
      ),);

      setState(() {
        _message.insert(0, message);
      });
      message.animationController.forward();
    
      if (!idList.contains(data['id'])) {
        idList.add(data['id']);
        mbtiList.add(data['mbti']);
        nameList.add(data['username']);
        imgList.add(data['img']);
        tokenList.add(data['token']);
        hasData = true;
      }
    });

=======
    socketIO.connect();
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return FutureBuilder(
      future: userListF,
      builder:
          (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (!hasData) {
            List<String> idListt = new List<String>();
            List<String> nameListt = new List<String>();
            List<String> mbtiListt = new List<String>();
            List<String> imgListt = new List<String>();
            List<String> tokenListt = new List<String>();
            for(int i=0; i<snapshot.data.length; i++){
              idListt.add(snapshot.data[i]['id']);
              nameListt.add(snapshot.data[i]['username']);
              mbtiListt.add(snapshot.data[i]['mbti']);
              imgListt.add(snapshot.data[i]['img']);
              tokenListt.add(snapshot.data[i]['token']);
            }
            idList = idListt;
            nameList = nameListt;
            mbtiList = mbtiListt;
            imgList = imgListt;
            tokenList = tokenListt;
          }
          bossname = chatInfo['bossname'];
          bossid = chatInfo['boss'];
          bossmbti = chatInfo['bossmbti'];
          img = chatInfo['img'];
          return body();
        } else {
          return Text('');
        }
      },
    );
  }

  Widget body() {
    String reportType = '욕설';
    TextEditingController reportController = new TextEditingController();
    if(load != null){
      for(int i=0; i<load.length; i++){
      if(load[i]['message']== null){
        if(load[i]['type'] == 'enter')
          _message.add(EnterMessage(data: load[i], animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 5)),));
        else if(load[i]['type'] == 'kick')
          _message.add(KickMessage(data: load[i], animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 5)),));
        else
          _message.add(LeaveMessage(data: load[i], animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 5)),));
      }
      else if(load[i]['id'] == shared.getString('id')){
        _message.add(ChatMessageS(data: load[i], animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 5))));
      }
      else{
        _message.add(ChatMessageR(data: load[i], animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 5))));
      }
      _message[i].animationController.forward();
    }
    }
    ImageProvider c;
    if (img == 'x') {
      if(bossmbti != null){
        c = Image.asset('assets/mbti/' + bossmbti + '.png').image;
      }
      else{
        c = Image.asset('assets/person.png').image;
      }
    }
    else {
      c = CachedNetworkImageProvider('http://$myIP:3001/$img');
    }
    return Scaffold(
      endDrawer: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //Container(height: 50,),
          Container(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .6,
            child: Drawer(
                child: Column(
              children: <Widget>[
                /*SizedBox(
                    height: 100,
                    child: DrawerHeader(
                      child: Text('cddd')
                    ),
                  ),*/
                Expanded(
                  child: ListView.builder(
                    
                      itemCount: idList.length,
                      itemBuilder: (_, i) {
                        bool isBoss = false;
                        bool isMy = false;
                        if(shared.getString('id') == bossid){
                          isBoss = true;
                        }
                        if(shared.getString('id') == idList[i]){
                          isMy = true;
                        }
                        ImageProvider c;

                        if (imgList[i] == 'x') {
                          if(mbtiList[i] != null){
                            c = AssetImage('assets/mbti/' + mbtiList[i] + '.png');
                          }
                          else{
                            c = AssetImage('assets/person.png');
                          }

                        }
                        else {
                          c = CachedNetworkImageProvider(
                              'http://$myIP:3001/${imgList[i]}');
                        }
                        return Container(
                            padding:
                                const EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 0),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 17,
                                  backgroundImage: c,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                        nameList[i],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 5,),
                                        Visibility(
                                          child: Icon(MyFlutterApp.queen_crown, size: 11, color: Colors.yellow[700],),
                                          visible: bossid == idList[i],
                                        ),
                                        ],
                                      ),
                                      
                                      Text(
                                        mbtiList[i] != null ? mbtiList[i] : 'x',
                                        style: mbtiList[i] != null ? TextStyle(fontSize: 8, color: mbti_color[mbtiList[i]], fontWeight: FontWeight.bold) : TextStyle(fontSize: 8, color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                Visibility(
                                  child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  width: 42,
                                  child: IconButton(
                                    color: Colors.red[300],
                                    icon: Icon(MyFlutterApp.ban),
                                    onPressed: () => {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            buildKickMessage(context, i),
                                      )
                                      
                                    },
                                    
                                  ),
                                ),
                                visible: isBoss & !isMy,
                                ),
                                
                                Visibility(
                                  child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  width: 42,
                                  child: IconButton(
                                    color: Colors.red[300],
                                    icon: Icon(Icons.report),
                                    onPressed: () => {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return new AlertDialog(
                                                  title: Text('신고'),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Text('신고유형: '),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          DropdownButton<
                                                              String>(
                                                            value: reportType,
                                                            autofocus: true,
                                                            onChanged: (String
                                                                newType) {
                                                              setState(() {
                                                                reportType =
                                                                    newType;
                                                              });
                                                            },
                                                            items: <String>[
                                                              '욕설',
                                                              '비방',
                                                              '무리한 요구',
                                                              '약속 파기'
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                              );
                                                            }).toList(),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 100,
                                                        width: 200,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black)),
                                                        child: TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none),
                                                          keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                          maxLines: null,
                                                          controller:
                                                              reportController,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    new FlatButton(
                                                        onPressed: () async {
                                                          Map<String, dynamic>
                                                              response =
                                                              await apiService.report(
                                                                  shared
                                                                      .getString(
                                                                          'id'),
                                                                  idList[i],
                                                                  reportType,
                                                                  reportController
                                                                      .text,
                                                                  DateTime.now()
                                                                      .toString());
                                                          Fluttertoast
                                                              .showToast(
                                                            msg: response[
                                                                'message'],
                                                            toastLength: Toast
                                                                .LENGTH_LONG,
                                                          );
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          '제출',
                                                        )),
                                                    new FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          '닫기',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ))
                                                  ],
                                                );
                                              },
                                            );
                                          })
                                    },
                                  ),
                                ),
                                visible: !isMy,
                                ),
                                
                                Container(
                                  padding: const EdgeInsets.all(3.0),
                                  width: 42,
                                  child: IconButton(
                                    color: Colors.blue[300],
                                    icon: Icon(MyFlutterApp.comment),
                                    onPressed: () async{
                                      comments = await apiService.show_comment(idList[i]);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            buildCommentDialog(context, i),
                                      );
                                    },
                                    
                                  ),
                                ),
                              ],
                            ));
                      }),
                ),
                FlatButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                      buildLeaveMessage(context),
                    );                    
                  },
                  child: Icon(Icons.exit_to_app),
                )
              ],
            )),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () {
              hasData= false;
              DBHelper().createData(_message);
              
              Navigator.of(context).pop();
            }
          ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: c,
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bossname +
                        '님의 ' +
                        travel_spots[int.parse(widget.category) - 1]['name'] +
                        ' 동행 채팅방',
                    style: Theme.of(context).textTheme.subhead,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    bossmbti != null ? bossmbti : 'x',
                    style: bossmbti != null ? TextStyle(fontSize: 10, color: mbti_color[bossmbti]) : TextStyle(fontSize: 10, color: Colors.black) ,
                  )
                ],
              ),
            )
          ],
        ),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.people),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip:
                    MaterialLocalizations.of(context).openAppDrawerTooltip),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.12), BlendMode.dstATop),
                image: AssetImage(travel_spots[int.parse(widget.category) - 1]['img']))),
=======
    return Scaffold(
      appBar: AppBar(
        title: Text('France'),
        // appBar 하단의 그림자 정도
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: Container(
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
        child: Column(
          children: <Widget>[
            // 리스트뷰를 Flexible로 추가.
            Flexible(
              // 리스트뷰 추가
              child: ListView.builder(
<<<<<<< HEAD
=======
                //shrinkWrap: true,
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
                padding: const EdgeInsets.all(8.0),
                // 리스트뷰의 스크롤 방향을 반대로 변경. 최신 메시지가 하단에 추가됨
                reverse: true,
                itemCount: _message.length,
                itemBuilder: (_, index) => _message[index],
<<<<<<< HEAD
=======
                controller: scrollController,
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
              ),
            ),
            // 구분선
            Divider(height: 1.0),
<<<<<<< HEAD
            textWindow()
          ],
        ),
=======
            // 메시지 입력을 받은 위젯(_buildTextCompose)추가
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
        // iOS의 경우 데코레이션 효과 적용
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200])))
            : null,
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
      ),
    );
  }

<<<<<<< HEAD
  Widget textWindow() {
    return Container(
        margin: EdgeInsets.all(15.0),
        height: 55,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          color: Colors.grey)
                    ]),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.face), color: Colors.grey,onPressed: () {}),
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        // 입력된 텍스트에 변화가 있을 때 마다
                        onChanged: (text) {
                          setState(() {
                            _isComposing = text.length > 0;
                          });
                        },
                        // 키보드상에서 확인을 누를 경우. 입력값이 있을 때에만 _handleSubmitted 호출
                        onSubmitted: _isComposing ? _handleSubmitted : null,
                        decoration: InputDecoration(border: InputBorder.none ,),
                      ),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: InkWell(
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                ),
              ),
            )
          ],
        ));
  }

  Widget buildKickDialog(BuildContext context) {
    return new AlertDialog(
      title: Text('알림'),
      content: Text('당신은 강퇴 당하였습니다!'),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('닫기'))
      ],
    );
  }

  Widget buildLeaveMessage(BuildContext context){
    return new AlertDialog(
      title: Text('채팅방 나가기'),
      content: Text('채팅방을 나가시겠습니까?'),
      actions: <Widget>[
        FlatButton(
                  onPressed: (){
                    String room_num = shared.getString('room_num');
                    String leave = widget.num.toString();
                    String update_room;

                    if(room_num.length == 1) room_num.replaceAll(leave, '');
                    else {
                      update_room = room_num.replaceAll(','+leave,'');
                    }             
                    
                    shared.setString('room_num', update_room);
                    socketIO.sendMessage('send_leave', jsonEncode({'room': widget.num, 'id': shared.getString('id'), 'username': shared.getString('username'), 'mbti': shared.getString('mbti'), 'img': shared.getString('img'), 'type': 'leave'}));                      
                    apiService.leaveRoom(shared.getString('id'), update_room, widget.num, bossid == shared.getString('id'));
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('나가기', style: TextStyle(color: Colors.red),),
                ),
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('닫기'),
        )
      ],
    );
  }

  Widget buildKickMessage(BuildContext context, int i){
    ImageProvider c;
    if(imgList[i] == 'x'){
      if(mbtiList[i] != null)
        c = AssetImage('assets/mbti/' + mbtiList[i] + '.png');
      else
        c = AssetImage('assets/person.png');
    }
    else
      c = CachedNetworkImageProvider('http://$myIP:3001/${imgList[i]}');
          
    return new AlertDialog(
      title: Row(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                          CircleAvatar(
                      radius: 17,
                      backgroundImage: c,
                    ),
                    Text(nameList[i], style: TextStyle(fontSize: 9),),
            ],
          ),
          SizedBox(width: 15,),
          Text('강퇴하기', style: TextStyle(color: Colors.red),)
        ],
      ),
      content: 

          
            Text('${nameList[i]}님을 강퇴하시겠습니까?\n강퇴되면 해당 유저는 방을 다시 입장할 수 없습니다!'),
          

      actions: <Widget>[
        FlatButton(
            onPressed: () {
              socketIO.sendMessage('kickip',
                json.encode({'id': idList[i], 'room': widget.num, 'username': nameList[i], 'mbti': mbtiList[i], 'img': imgList[i], 'type': 'kick'}));
              Navigator.of(context).pop();
            },
            child: Text('강퇴', style: TextStyle(color: Colors.red),)),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('닫기'))
      ],

    );
    
  }

  Widget buildCommentDialog(BuildContext context, int i,){
    return new AlertDialog(
      title: Text(nameList[i] +'님 평가내용'),
      content: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*.4,
        width: MediaQuery.of(context).size.width*.7,
        child: ListView.builder(
        padding: const EdgeInsets.all(7.0),
        itemCount: comments.length,
        itemBuilder: (_, i) {
          ImageProvider c;
          if(comments[i]['img'] == 'x'){
            if(comments[i]['mbti'] != null){
            c = AssetImage('assets/mbti/' + comments[i]['mbti'] + '.png');
            }
            else{
              c = AssetImage('assets/person.png');
            }
          }
          else{
            c = CachedNetworkImageProvider('http://$myIP:3001/${comments[i]['img']}');
          }
          return Container(
            padding: const EdgeInsets.fromLTRB(3, 7, 3, 7),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 17,
                      backgroundImage: c,
                    ),
                    Text(comments[i]['username'], style: TextStyle(fontSize: 9),),
                    Text(comments[i]['mbti'] != null ? comments[i]['mbti']:'x', style: comments[i]['mbti'] != null ? TextStyle(fontSize: 10, color: mbti_color[comments[i]['mbti']]) : TextStyle(fontSize: 10, color: Colors.black),)
                  ],
                ),
                SizedBox(width: 15,),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width*.5
                  ),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                  color: Colors.cyan[300],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                    ),
                  ),
                  child: Text(comments[i]['comment']),
                )
              ],
            ),
          );
        },
      ),
      )
    ),
        ],
      ),
      
      actions: <Widget>[
        new FlatButton(
          onPressed: () async{
            showDialog(
              context: context,
              builder: (BuildContext context) => buildEvaluateDialog(context,i),
            );
          },
          child: Text('평가하기',)
        ),
        new FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('닫기', style: TextStyle(color: Colors.red),)
        )
      ],
    );
  }

  Widget buildEvaluateDialog(BuildContext context, int i){
    TextEditingController commentController = new TextEditingController();
    return new AlertDialog(
      title: Text(nameList[i] +'님 평가하기'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: TextFormField(
              
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: commentController,
            ),
          ),
        ],
      ),
      
      
      actions: <Widget>[
        new FlatButton(
          onPressed: () async{
            Map<String, dynamic> response = await apiService.comments(shared.getString('id'), shared.getString('username'), shared.getString('mbti'), shared.getString('img'), idList[i], commentController.text);
            Fluttertoast.showToast(
              msg: response['message'],
              toastLength: Toast.LENGTH_LONG,
            );
            setState(() {
              
              comments.add({
                'id': shared.getString('id'),
                'username': shared.getString('username'),
                'mbti': shared.getString('mbti'),
                'img': shared.getString('img'),
                'comment': commentController.text
              });
              
            });
            
            Navigator.of(context).pop(context);
          },
          child: Text('평가하기',)
        ),
        new FlatButton(
          onPressed: (){
            Navigator.of(context).pop(context);
          },
          child: Text('닫기', style: TextStyle(color: Colors.red),)
        )
      ],
=======
  // 사용자로부터 메시지를 입력받는 위젯 선언
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        //width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            // 텍스트 입력 필드
            Flexible(
              child: TextField(
                controller: _textController,
                // 입력된 텍스트에 변화가 있을 때 마다
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                // 키보드상에서 확인을 누를 경우. 입력값이 있을 때에만 _handleSubmitted 호출
                onSubmitted: _isComposing ? _handleSubmitted : null,
                // 텍스트 필드에 힌트 텍스트 추가
                decoration:
                InputDecoration.collapsed(hintText: "Send a message1"),
              ),
            ),
            // 전송 버튼
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              // 플랫폼 종류에 따라 적당한 버튼 추가
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                child: Text("send"),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              )
                  : IconButton(
                // 아이콘 버튼에 전송 아이콘 추가
                icon: Icon(Icons.send),
                // 입력된 텍스트가 존재할 경우에만 _handleSubmitted 호출
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
    );
  }

  // 메시지 전송 버튼이 클릭될 때 호출
  void _handleSubmitted(String text) {
<<<<<<< HEAD

=======
    //ApiService apiService = new ApiService();
    //apiService.chat("재형", "1번");
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
    // 텍스트 필드의 내용 삭제
    _textController.clear();
    // _isComposing을 false로 설정
    setState(() {
      _isComposing = false;
    });
<<<<<<< HEAD
    Map<String, dynamic> data = {
      'message': text,
      'id': shared.getString('id'),
      'room': widget.num,
      'username': shared.getString('username'),
      'mbti': shared.getString('mbti'),
      'img': shared.getString('img')
    };
    for(int i=0; i< tokenList.length; i++){
        apiService.sendMessage(tokenList[i], text, data['username']);
    }



    socketIO.sendMessage('send_message', json.encode(data));
    // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
    ChatMessageS message = ChatMessageS(
      data: data,
=======
    socketIO.sendMessage(
        'send_message', json.encode({'message': text}));
    // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
    ChatMessageS message = ChatMessageS(
      text: text,
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
      // animationController 항목에 애니메이션 효과 설정
      // ChatMessage은 UI를 가지는 위젯으로 새로운 message가 리스트뷰에 추가될 때
      // 발생할 애니메이션 효과를 위젯에 직접 부여함
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    // 리스트에 메시지 추가
    setState(() {
      _message.insert(0, message);
    });
<<<<<<< HEAD
    // 위젯의 애니메이션 효과 발생
    message.animationController.forward();
=======
    //debugPrint(scrollController.position.maxScrollExtent.toString());
    // 위젯의 애니메이션 효과 발생
    message.animationController.forward();
    /*scrollController.animateTo(
      scrollController.position.maxScrollExtent+150,
      duration: Duration(milliseconds: 600),
      curve: Curves.ease
    );*/
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
  }

  @override
  void dispose() {
    // 메시지가 생성될 때마다 animationController가 생성/부여 되었으므로 모든 메시지로부터 animationController 해제
    for (ChatMessage message in _message) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

<<<<<<< HEAD
abstract class ChatMessage extends StatelessWidget {
  final Map<String, dynamic> data;
  final AnimationController animationController;

  ChatMessage({this.data, this.animationController});
=======
abstract class ChatMessage extends StatelessWidget{
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
}

// 리스브뷰에 추가될 메시지 위젯
class ChatMessageR extends ChatMessage {
<<<<<<< HEAD
  final Map<String, dynamic> data; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  ChatMessageR({this.data, this.animationController});
=======
  final String text; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  ChatMessageR({this.text, this.animationController});
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23

  @override
  Widget build(BuildContext context) {
    // 위젯에 애니메이션을 발생하기 위해 SizeTransition을 추가
    return SizeTransition(
<<<<<<< HEAD
        // 사용할 애니메이션 효과 설정
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        // 리스트뷰에 추가될 컨테이너 위젯
        child: receiveMessage(context));
  }

  Widget receiveMessage(BuildContext context) {
    ImageProvider c;
    if (data['img'] == 'x') {
      if(data['mbti'] != null){
        c = AssetImage('assets/mbti/' + data['mbti'] + '.png');
      }
      else{
        c = AssetImage('assets/person.png');
      }
    } else {
      c = CachedNetworkImageProvider('http://$myIP:3001/${data['img']}');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundImage: c,
                radius: 17,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                data['username'],
                style: TextStyle(fontSize: 9),
              )
            ],
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data['mbti']!= null ? data['mbti'] : 'x',
                style: data['mbti'] != null ? TextStyle(fontSize: 10, color: mbti_color[data['mbti']], fontWeight: FontWeight.bold) : TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.cyan[300],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Text(
                  data['message'],
                  style: Theme.of(context).textTheme.body2.apply(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ],
=======
      // 사용할 애니메이션 효과 설정
      sizeFactor:
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      // 리스트뷰에 추가될 컨테이너 위젯
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        
        //margin: const EdgeInsets.only(left: 100),
        child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            //Flexible(child: SizedBox(width: 1)),
            
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              // 사용자명의 첫번째 글자를 서클 아바타로 표시
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              // 컬럼 추가
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 사용자명을 subhead 테마로 출력
                  Text(_name, style: Theme.of(context).textTheme.subhead),
                  // 입력받은 메시지 출력
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
      ),
    );
  }
}

class ChatMessageS extends ChatMessage {
<<<<<<< HEAD
  final Map<String, dynamic> data; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  ChatMessageS({this.data, this.animationController});
=======
  final String text; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  ChatMessageS({this.text, this.animationController});
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23

  @override
  Widget build(BuildContext context) {
    // 위젯에 애니메이션을 발생하기 위해 SizeTransition을 추가
    return SizeTransition(
<<<<<<< HEAD
        // 사용할 애니메이션 효과 설정
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        // 리스트뷰에 추가될 컨테이너 위젯
        child: sendMessage(context));
  }

  Widget sendMessage(BuildContext context) {
    ImageProvider c;
    if (shared.getString('img') == 'x') {
      if(shared.getString('mbti') != null){
        c = AssetImage('assets/mbti/' + shared.getString('mbti') + '.png');
      }
      else{
        c = AssetImage('assets/person.png');
      }

    } else {
      c = CachedNetworkImageProvider(
          'http://$myIP:3001/${shared.getString('img')}');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                shared.getString('mbti') != null ? shared.getString('mbti'): 'x',
                style: shared.getString('mbti') != null ? TextStyle(fontSize: 10, color: mbti_color[shared.getString('mbti')], fontWeight: FontWeight.bold) : TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold)
                
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Text(
                  data['message'],
                  style: Theme.of(context).textTheme.body2.apply(
                        color: Colors.black,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundImage: c,
                radius: 17,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                shared.getString('username'),
                style: TextStyle(fontSize: 9),
              )
            ],
          )
        ],
      ),
    );
  }
}

class EnterMessage extends ChatMessage{
  final Map<String, dynamic> data; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  EnterMessage({this.data, this.animationController});

  @override
  Widget build(BuildContext context) {
    // 위젯에 애니메이션을 발생하기 위해 SizeTransition을 추가
    return SizeTransition(
        // 사용할 애니메이션 효과 설정
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        // 리스트뷰에 추가될 컨테이너 위젯
        child: enterMessage(context));
  }

  Widget enterMessage(BuildContext context) {
    ImageProvider c;
    if (data['img'] == 'x') {
      if(data['mbti'] != null){
        c = AssetImage('assets/mbti/' + data['mbti'] + '.png');
      }
      else{
        c = AssetImage('assets/person.png');
      }
    } else {
      c = CachedNetworkImageProvider('http://$myIP:3001/${data['img']}');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5,),//center에 안 맞아서
          CircleAvatar(
                backgroundImage: c,
                radius: 17,
              ),
          Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(12.0),
                
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(data['username']),
                        Text(data['mbti'] != null ? data['mbti'] : 'x', style: data['mbti'] != null ? TextStyle(fontSize: 10, color: mbti_color[data['mbti']]) : TextStyle(fontSize: 10, color: Colors.black),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          ' 님이 ',
                          style: Theme.of(context).textTheme.body2.apply(color: Colors.black,),
                        ),
                        Text(
                          '입장',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '했습니다.',
                          style: Theme.of(context).textTheme.body2.apply(color: Colors.black,),
                        ),
                      ],
                    )
                    
                  ],
                )
                
              ),
          
          
        ],
      ),
    );
  }
}

class KickMessage extends ChatMessage{
  final Map<String, dynamic> data; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  KickMessage({this.data, this.animationController});

  @override
  Widget build(BuildContext context) {
    // 위젯에 애니메이션을 발생하기 위해 SizeTransition을 추가
    return SizeTransition(
        // 사용할 애니메이션 효과 설정
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        // 리스트뷰에 추가될 컨테이너 위젯
        child: kickMessage(context));
  }

  Widget kickMessage(BuildContext context) {
    ImageProvider c;
    if (data['img'] == 'x') {
      if(data['mbti'] != null){
        c = AssetImage('assets/mbti/' + data['mbti'] + '.png');
      }
      else{
        c = AssetImage('assets/person.png');
      }
    } else {
      c = CachedNetworkImageProvider('http://$myIP:3001/${data['img']}');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5,),//center에 안 맞아서
          CircleAvatar(
                backgroundImage: c,
                radius: 17,
              ),
          Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(12.0),
                
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(data['username']),
                        Text(data['mbti'] != null ? data['mbti'] : 'x', style: data['mbti'] != null ? TextStyle(fontSize: 10, color: mbti_color[data['mbti']]) : TextStyle(fontSize: 10, color: Colors.black),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          ' 님이 ',
                          style: Theme.of(context).textTheme.body2.apply(color: Colors.black,),
                        ),
                        Text(
                          '강퇴',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '되었습니다.',
                          style: Theme.of(context).textTheme.body2.apply(color: Colors.black,),
                        ),
                      ],
                    )
                    
                  ],
                )
                
              ),
          
          
        ],
      ),
    );
  }
}

class LeaveMessage extends ChatMessage{
  final Map<String, dynamic> data; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될 때 보여질 효과

  LeaveMessage({this.data, this.animationController});

  @override
  Widget build(BuildContext context) {
    // 위젯에 애니메이션을 발생하기 위해 SizeTransition을 추가
    return SizeTransition(
        // 사용할 애니메이션 효과 설정
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        // 리스트뷰에 추가될 컨테이너 위젯
        child: leaveMessage(context));
  }

  Widget leaveMessage(BuildContext context) {
    ImageProvider c;
    if (data['img'] == 'x') {
      if(data['mbti'] != null){
        c = AssetImage('assets/mbti/' + data['mbti'] + '.png');
      }
      else{
        c = AssetImage('assets/person.png');
      }
    } else {
      c = CachedNetworkImageProvider('http://$myIP:3001/${data['img']}');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5,),//center에 안 맞아서
          CircleAvatar(
                backgroundImage: c,
                radius: 17,
              ),
          Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(12.0),
                
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(data['username']),
                        Text(data['mbti'] != null ? data['mbti'] : 'x', style: data['mbti'] != null ? TextStyle(fontSize: 10, color: mbti_color[data['mbti']]) : TextStyle(fontSize: 10, color: Colors.black) ,)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          ' 님이 ',
                          style: Theme.of(context).textTheme.body2.apply(color: Colors.black,),
                        ),
                        Text(
                          '퇴장',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '하셨습니다.',
                          style: Theme.of(context).textTheme.body2.apply(color: Colors.black,),
                        ),
                      ],
                    )
                    
                  ],
                )
                
              ),
          
          
        ],
=======
      // 사용할 애니메이션 효과 설정
      sizeFactor:
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      // 리스트뷰에 추가될 컨테이너 위젯
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        
        //margin: const EdgeInsets.only(left: 100),
        child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(child: SizedBox(width: 1, height: 1,)),
            Expanded(
              // 컬럼 추가
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // 사용자명을 subhead 테마로 출력
                  Text(_name, style: TextStyle(fontSize: 9)),
                  // 입력받은 메시지 출력
                  Container(child: SizedBox(height: 7,), color: Colors.red,),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    
                    child: Text(text, style: TextStyle(fontSize: 15, fontFamily: 'RobotoSlab')),
                  ),
                  Container(child: SizedBox(height: 10,), color: Colors.red,),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              // 사용자명의 첫번째 글자를 서클 아바타로 표시
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: new AssetImage('assets/mbti/ENFJ.png')
                  ),
                  Text('ENFJ', style: TextStyle(fontSize: 8),)
                ],
              ),
              /*child: CircleAvatar(
                backgroundImage: new AssetImage('assets/mbti/ENFJ.png')
              )*/
            ),
          ],
        ),
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
      ),
    );
  }
}