import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/messenger/views/loading.dart';
import 'package:flutter/material.dart';
import '../helper/constans.dart';
import '../helper/helpfunction.dart';
import '../servisec/auth.dart';
import '../servisec/database.dart';
import 'conversation.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthServices authServices = AuthServices();
  DatabaseMethods databaseMethods = DatabaseMethods();
  Stream? chatRoomsStream;
  bool isLoading = false;

  Widget chatRoomList() {
    return StreamBuilder(
        stream: chatRoomsStream,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }
          if (snapshot.hasError) {
            return Loading();
          }

          QuerySnapshot data = snapshot.requireData as QuerySnapshot;
          return snapshot.hasData
              ? ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return ChatRoomTile(
                  chatRoomId: data.docs[index].get('chatroomID'),
                  userName: data.docs[index]
                      .get('chatroomID')
                      .toString()
                      .replaceAll("_", "")
                      .replaceAll(Constants.myName, ""));
            },
          )
              : Container();
        });
  }

  @override
  void initState() {
    getUserInfoGetChats();
    super.initState();
  }

  getUserInfoGetChats() async {
    Constants.myName = (await HelperFunctions.getUserNameSharedPreference())!;
    databaseMethods.getChatRooms(Constants.myName).then((val) {
      setState(() {
        chatRoomsStream = val;
        print(
            "we got the data + ${chatRoomsStream.toString()} this is name  ${Constants.myName}");
      });
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ЧАТЫ", style: TextStyle(color: Color(0xff246E46)),),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 50),
                padding: const EdgeInsets.only(left: 30, top: 20)),
            Container(
              child: chatRoomList(),
              margin: EdgeInsets.only(top: 100),
            )
          ],
        ),
      ),
    );
  }
}

class ChatRoomTile extends StatefulWidget {
  final String userName;
  final String chatRoomId;
  const ChatRoomTile(
      {Key? key, required this.userName, required this.chatRoomId})
      : super(key: key);

  @override
  State<ChatRoomTile> createState() => _ChatRoomTileState(userName, chatRoomId);
}

class _ChatRoomTileState extends State<ChatRoomTile> {
  final String userName;
  final String chatRoomId;
  _ChatRoomTileState(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Conversation(chatroomId: chatRoomId, userName: userName)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF1F1F1)),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xff83C17F), borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
