import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Post Home Screen"),centerTitle: true),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,right: 12,left: 12),
                    child: InkWell(onTap: () {
                      Navigator.pushNamed(context, 'insta');
                    },
                      child: Container(height: 80,width: 360,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.deepPurple.shade600,Colors.orange.shade600]),
                        boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,spreadRadius: 2,blurStyle: BlurStyle.outer)]),
                        child: Center(child: Text("Instagram Post",style: TextStyle(fontSize: 30))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,right: 12,left: 12),
                    child: InkWell(onTap: () {
                      Navigator.pushNamed(context, 'simpalinput');
                    },
                      child: Container(height: 80,width: 360,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.deepPurple.shade600,Colors.orange.shade600]),
                          boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,spreadRadius: 2,blurStyle: BlurStyle.outer,)]),
                        child: Center(child: Text("Simpal Post",style: TextStyle(fontSize: 30))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,right: 12,left: 12),
                    child: InkWell(onTap: () {
                      Navigator.pushNamed(context, 'linkedinpost');
                    },
                      child: Container(height: 80,width: 360,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.deepPurple.shade600,Colors.orange.shade600]),
                          boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,spreadRadius: 2,blurStyle: BlurStyle.outer)]),
                        child: Center(child: Text("Linkedin Post",style: TextStyle(fontSize: 30))),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
