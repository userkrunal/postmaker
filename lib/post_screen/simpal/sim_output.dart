import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post/post_screen/simpal/simpal_input.dart';

class SimpalOutput extends StatefulWidget {
  const SimpalOutput({Key? key}) : super(key: key);

  @override
  State<SimpalOutput> createState() => _SimpalOutputState();
}

class _SimpalOutputState extends State<SimpalOutput> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SimModel simModel=ModalRoute.of(context)!.settings.arguments as SimModel;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Post",style: GoogleFonts.poppins(),),centerTitle: true,
        actions: [
          IconButton(onPressed: () async {
            RenderRepaintBoundary? renderBoundery=_globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
            var image=await renderBoundery.toImage();
            var byteData=await image.toByteData(format: ImageByteFormat.png);
            Uint8List uint8List = byteData!.buffer.asUint8List();

            await ImageGallerySaver.saveImage(uint8List);
          }, icon: Icon(Icons.download))],),
      body: RepaintBoundary(
        key: _globalKey,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: FileImage(File("${simModel.path}")),
                        radius: 70,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200,left: 40),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade100
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("${simModel.name}",style: GoogleFonts.ibmPlexMono(color: Colors.white,fontSize: 50)),
                        SizedBox(height: 10),
                        Text("${simModel.mobile}",style: GoogleFonts.ibmPlexMono(color: Colors.white,fontSize: 30)),
                        SizedBox(height: 10),
                        Text("${simModel.id}",style: GoogleFonts.ibmPlexMono(color: Colors.white,fontSize: 30)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
