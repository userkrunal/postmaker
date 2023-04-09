import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class LinkeDinPost extends StatefulWidget {
  const LinkeDinPost({Key? key}) : super(key: key);

  @override
  State<LinkeDinPost> createState() => _LinkeDinPostState();
}

class _LinkeDinPostState extends State<LinkeDinPost> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtMobile=TextEditingController();
  TextEditingController txtEmail=TextEditingController();
  TextEditingController txtProfession=TextEditingController();
  TextEditingController txtQualification=TextEditingController();
  String? path;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Linkedin Post",style: GoogleFonts.poppins(fontSize: 20)),centerTitle: true,),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  CircleAvatar(
                    backgroundImage: FileImage(File("${path}")),
                    radius: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80,left: 75),
                      child: IconButton(onPressed: () async {
                        ImagePicker imagePicker=ImagePicker();
                        XFile? xfile=await imagePicker.pickImage(source: ImageSource.camera);
                        setState(() {
                          path=xfile!.path;
                        });
                      },icon: Icon(Icons.camera,color: Colors.brown.shade500,),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      focusColor: Colors.brown.shade500,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:  Colors.brown.shade500,width: 2)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown.shade500,width: 2),borderRadius: BorderRadius.circular(10)),
                      labelText: "Enter  Company Name",
                      hintText: " Company Name",
                      labelStyle: GoogleFonts.poppins(color: Colors.brown.shade500)
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtProfession,
                    decoration: InputDecoration(
                        focusColor: Colors.brown.shade500,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:  Colors.brown.shade500,width: 2)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown.shade500,width: 2),borderRadius: BorderRadius.circular(10)),
                        labelText: " Enter Profession",
                        hintText: "Coding",
                        labelStyle: GoogleFonts.poppins(color: Colors.brown.shade500)
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtMobile,
                    decoration: InputDecoration(
                        focusColor: Colors.brown.shade500,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:  Colors.brown.shade500,width: 2)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown.shade500,width: 2),borderRadius: BorderRadius.circular(10)),
                        labelText: "Mobile No.",
                        hintText: "+91 2038474657",
                        labelStyle: GoogleFonts.poppins(color: Colors.brown.shade500)
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                        focusColor: Colors.brown.shade500,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:  Colors.brown.shade500,width: 2)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown.shade500,width: 2),borderRadius: BorderRadius.circular(10)),
                        labelText: "Enter E-mail",
                        hintText: "abcd364@gmail.com",
                        labelStyle: GoogleFonts.poppins(color: Colors.brown.shade500)
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtQualification,
                    decoration: InputDecoration(
                        focusColor: Colors.brown.shade500,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:  Colors.brown.shade500,width: 2)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown.shade500,width: 2),borderRadius: BorderRadius.circular(10)),
                        labelText: "Enter Qualification",
                        hintText: "Flutter devloper",
                        labelStyle: GoogleFonts.poppins(color: Colors.brown.shade500)
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {
                  LinkedinpostModel pm=LinkedinpostModel(name: txtName.text,path: path,mobile: txtMobile.text,pr: txtProfession.text,email: txtEmail.text,qa: txtQualification.text);
                  Navigator.pushNamed(context, 'linkoutput',arguments: pm);
                }, child: Text("Creat",style: GoogleFonts.poppins(color: Colors.brown.shade500),))
              ],
            ),
          ),
        ));
  }
}
class LinkedinpostModel
{
  String? name,path,pr,mobile,email,qa;

  LinkedinpostModel({this.name, this.path, this.pr, this.mobile, this.email,this.qa});


}