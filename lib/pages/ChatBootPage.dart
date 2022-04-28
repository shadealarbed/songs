import 'package:flutter/material.dart';

import 'package:senior_demo/components/constants.dart';

class ChatBootPage extends StatefulWidget {
  static final id = "chatbootbage";

  const ChatBootPage({Key? key}) : super(key: key);

  @override
  _ChatBootPageState createState() => _ChatBootPageState();
}

class _ChatBootPageState extends State<ChatBootPage> {
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Hi how may i help you"),
          backgroundColor: Colors.deepPurple,
          actions: [
            Hero(
              child: Image.asset("assets/note1.png"),
              tag: 1,
            ),
          ]),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {},
                          ),
                          hintText: "Send Message",
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0))),
                      onChanged: (value) {
                        msg = value;
                      },
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.send),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
