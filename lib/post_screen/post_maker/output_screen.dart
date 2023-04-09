import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post/postmodel/post_model.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key? key}) : super(key: key);

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    PostModel postModel=ModalRoute.of(context)!.settings.arguments as PostModel;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Insta Post"),actions: [
            IconButton(onPressed: () async {
              RenderRepaintBoundary? renderBoundery=_globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
              var image=await renderBoundery.toImage();
              var byteData =await image.toByteData(format: ImageByteFormat.png);
              Uint8List uint8List =byteData!.buffer.asUint8List();

              await ImageGallerySaver.saveImage(uint8List);
            }, icon: Icon(Icons.download))
          ],),
          body: RepaintBoundary(
            key:_globalKey,

            child: Stack(
              children: [
                Container(
                  height:300,
                  width:double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.amber.shade500,offset: Offset(0,20))],
                    color: Colors.red,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 200),bottomRight:  Radius.elliptical(300, 200)),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 185),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 270,
                        width: 270,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(150),color: Colors.amber.shade500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CircleAvatar(
                        backgroundImage: FileImage(File("${postModel.path}")),
                        radius: 120,
                      ),
                    ],
                  ),
                ),
                Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Container(
                     height:360,
                     width:double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(topLeft: Radius.elliptical(300, 200),topRight:  Radius.elliptical(300, 200)),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(top: 100),
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("${postModel.name}",style: GoogleFonts.notoSerifKhojki(fontSize: 30,color: Colors.amber)),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("${postModel.instid}",style: GoogleFonts.notoSerifKhojki(fontSize: 20,color: Colors.amber)),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("${postModel.tag}",style: GoogleFonts.notoSerifKhojki(fontSize: 40,color: Colors.amber)),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),

    ));
  }
}
            // Container(
            // height: 350,
            // width:350,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(150),color: Colors.blue),
            // child: CircleAvatar(
            // backgroundImage: FileImage(File("${postModel.path}")),
            // radius: 120,
            // ),
            // ),