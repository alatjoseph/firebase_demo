import 'package:chatbox/chatroom.dart';
import 'package:flutter/material.dart';
import 'messagelist.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController nameController = TextEditingController(); //controller for username textfield
  TextEditingController passwordController = TextEditingController(); //controller for password textfield
  
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                username = nameController.text;
                //Now the entered password is stored in the variable 'username'
                password = passwordController.text;
                //Now the entered password is stored in the variable 'password'

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Chatroom(
                    name: username,
                  ),
                ));
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      )),
    );
  }
}
