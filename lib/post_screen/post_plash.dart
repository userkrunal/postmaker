import 'dart:async';

import 'package:flutter/material.dart';

class Post_Plash extends StatefulWidget {
  const Post_Plash({Key? key}) : super(key: key);

  @override
  State<Post_Plash> createState() => _Post_PlashState();
}

class _Post_PlashState extends State<Post_Plash> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black45,spreadRadius: 2,blurRadius:5)],
                borderRadius: BorderRadius.circular(90),
                color: Colors.pink.shade100,
              ),
              child: CircleAvatar(backgroundImage: AssetImage("assets/post1.jpg"),)
            ),
          ),
        ),
    );
  }
}
