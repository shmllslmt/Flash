import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash/constants.dart';

User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //Create another private FirebaseAuth instance
  final _auth = FirebaseAuth.instance;

  //Create a Firestore instance
  final _firestore = FirebaseFirestore.instance;

  String? messageText;

  //Create a TextEditingController
  final messageController = TextEditingController();

  //Create a getCurrentUser() method that will check whether a user is signed in
  void getCurrentUser() {
    final user = _auth.currentUser;

    if(user != null) {
      loggedInUser = user;

      print(loggedInUser!.email);
    }
  }

  //Override the initState() method to call the getCurrentUser()
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              //Sign Out
              _auth.signOut();

              //Pop back to previous screen
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Create a StreamBuilder<QuerySnapshot<Map<String, dynamic>>> widget
            StreamBuilder(
              //For the stream property, _firestore.collection('messages').orderBy('timestamp').snapshots()
              stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(!snapshot.hasData) {
                  //If snapshot has no data, return a CircularProgressIndicator
                  return Container(
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  );
                }
                  else {
                  //If snapshot has data, create a list of Text widgets - the Text widgets will contain the messages, then return a ListView with the list of Text widgets as children
                  var messages = snapshot.data.docs;
                  List<Text> messageWidgets = [];

                  for(var message in messages) {
                    final messageText = message.data()['text'];
                    final messageSender = message.data()['sender'];

                    final messageWidget = Text('$messageText from $messageSender', style: TextStyle(color: Colors.white),);
                    messageWidgets.add(messageWidget);
                  }
                  return Expanded(
                    child: ListView(
                      children: messageWidgets,
                    ),
                  );
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Clear the TextEditingController
                      messageController.clear();

                      //Add data (messageText, sender, timestamp) to the collection
                      _firestore.collection('messages').add({
                        'sender': loggedInUser!.email,
                        'text': messageText,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 10.0,
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
