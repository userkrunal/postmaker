import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post/postmodel/post_model.dart';

class InstaPost extends StatefulWidget {
  const InstaPost({Key? key}) : super(key: key);

  @override
  State<InstaPost> createState() => _InstaPostState();
}

class _InstaPostState extends State<InstaPost> {
  String path="";
  PostModel postModel=PostModel();
  TextEditingController txtName=TextEditingController();
  TextEditingController txtInstaId=TextEditingController();
  TextEditingController txtTag=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Insta Post",style: GoogleFonts.ibmPlexMono(fontSize: 30,color: Colors.white)),centerTitle: true),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                  CircleAvatar(
                    backgroundImage:FileImage(File("${path}")),
                    radius: 60,
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 80,left: 75,),
                      child: IconButton(onPressed: () async {
                        ImagePicker imagePicker =ImagePicker();
                        XFile? xfile=await imagePicker.pickImage(source: ImageSource.camera);
                        setState(() {
                          path=xfile!.path;
                        });

                      }, icon: Icon(Icons.camera,color: Colors.purple.shade300,size: 30,)),
                    )
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
                  child: TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      // focusColor: Colors.purpleAccent.shade100,
                      labelStyle: GoogleFonts.ibmPlexMono(color: Colors.purple.shade200),
                      label: Text("Enter Name"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100,width: 2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100))),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
                  child: TextField(
                    controller: txtInstaId,
                    decoration: InputDecoration(
                      focusColor: Colors.purple.shade100,

                        labelStyle: GoogleFonts.ibmPlexMono(color: Colors.purple.shade200),
                        label: Text("Enter Insta Id"),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100,width: 2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100))),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
                  child: TextField(
                    controller: txtTag,
                    decoration: InputDecoration(
                        labelStyle: GoogleFonts.ibmPlexMono(color: Colors.purple.shade200),
                        label: Text("Enter Tag"),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100,width: 2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100))),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(onPressed: () {

                      PostModel pm=PostModel(name: txtName.text,instid: txtInstaId.text,tag: txtTag.text,path: path);
                      Navigator.pushNamed(context, 'instapost',arguments: pm);
                  }, child: Text("Creat",style:GoogleFonts.ibmPlexMono(fontSize: 30,color: Colors.purple.shade400)),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade100),),
                )
              ],
            ),
          ),
        ),
    );
  }
}
