import 'package:flutter/material.dart';

import 'messagelist.dart';

/// A List named as Message is created to store messages from the user and is created in th lib folder as "messagelist.dart"
/// and that file is imported
class Chatroom extends StatefulWidget {
  String name;
  Chatroom({super.key, required this.name});

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); //pop to login page
                    },
                    child: const Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
          Expanded(

              ///The messages from the list is taken and display the cossesponding messages with the
              ///user name using  ' ListView.builder' widget

              child: ListView.builder(
            itemCount: Messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  widget.name,

                  ///display  username by using variable called "name" that you've passed through the constructor
                  ///
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  Messages[index],
                  style: const TextStyle(fontSize: 17),
                ),
              );
            },
          )),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Message',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  ///The above text field is used to display the textfield were the user type their messages
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      String message = messageController.text;
                      if (message.isNotEmpty) {
                        Messages.add(message);
                        ///on tapping the button, the corresponding messege in textfield is
                        /// added to the previously  created List named as "Messages"
                      }

                      messageController
                          .clear(); //clear the textfield after send the messege
                    });
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ))
            ],
          ),
        ],
      ),
    )));
  }
}
