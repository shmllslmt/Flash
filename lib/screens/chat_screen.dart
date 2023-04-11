import 'package:flutter/material.dart';
import 'package:flash/constants.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //TODO: Step 23 - Create another private FirebaseAuth instance
  //TODO: Step 29 - Create a Firestore instance
  //TODO: Step 34 - Create a TextEditingController

  //TODO: Step 24 - Create a getCurrentUser() method that will check whether a user is signed in

  //TODO: Step 25 - Override the initState() method to call the getCurrentUser()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            //TODO: Step 27 - Sign Out
            //TODO: Step 28 - Pop back to previous screen
            onPressed: () {},
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
            //TODO: Step 30 - Create a StreamBuilder<QuerySnapshot<Map<String, dynamic>>> widget
            //TODO: Step 31 - For the stream property, _firestore.collection('messages').orderBy('timestamp').snapshots()
            //TODO: Step 32 - If snapshot has data, create a list of Text widgets - the Text widgets will contain the messages, then return a ListView with the list of Text widgets as children
            //TODO: Step 33 - If snapshot has no data, return a CircularProgressIndicator
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    //TODO: Step 29 - Add data (messageText, sender, timestamp) to the collection
                    //TODO: Step 35 - Clear the TextEditingController
                    onPressed: () {},
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
