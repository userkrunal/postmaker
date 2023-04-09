import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Simpal_Screen extends StatefulWidget {
  const Simpal_Screen({Key? key}) : super(key: key);

  @override
  State<Simpal_Screen> createState() => _Simpal_ScreenState();
}

class _Simpal_ScreenState extends State<Simpal_Screen> {
  String? path;
  TextEditingController txtName=TextEditingController();
  TextEditingController txtMobile=TextEditingController();
  TextEditingController txtInstaid=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Post",style: GoogleFonts.adamina(),),centerTitle: true,
       ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
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
                controller: txtMobile,
                decoration: InputDecoration(
                  // focusColor: Colors.purpleAccent.shade100,
                    labelStyle: GoogleFonts.ibmPlexMono(color: Colors.purple.shade200),
                    label: Text("Mobile"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100,width: 2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
              child: TextField(
                controller: txtInstaid,
                decoration: InputDecoration(
                  // focusColor: Colors.purpleAccent.shade100,
                    labelStyle: GoogleFonts.ibmPlexMono(color: Colors.purple.shade200),
                    label: Text("Insta Id"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100,width: 2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.purple.shade100))),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(onPressed: () {
              SimModel sm=SimModel(name: txtName.text,path: path,mobile: txtMobile.text,id: txtInstaid.text);
                Navigator.pushNamed(context, 'simpaloutput',arguments: sm);
            }, child: Text("Creat",style: GoogleFonts.poppins(fontSize: 30,color: Colors.purple.shade500)),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade200)),
          ],
        ),
      ),
    ));
  }
}
class SimModel
{
  String? name,path,mobile,id;

  SimModel({this.name, this.path, this.mobile, this.id});
}