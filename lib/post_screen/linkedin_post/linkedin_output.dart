import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post/post_screen/linkedin_post/linkdin_input.dart';

class LinkeDin_Output extends StatefulWidget {
  const LinkeDin_Output({Key? key}) : super(key: key);

  @override
  State<LinkeDin_Output> createState() => _LinkeDin_OutputState();
}

class _LinkeDin_OutputState extends State<LinkeDin_Output> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    LinkedinpostModel linkedinpostModel=ModalRoute.of(context)!.settings.arguments as LinkedinpostModel;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Linkedin Post",style: GoogleFonts.poly()),centerTitle: true,
            actions: [
              IconButton(onPressed: () async {
                RenderRepaintBoundary? renderBoundery=_globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                var image=await renderBoundery.toImage();
                var byteData=await image.toByteData(format: ImageByteFormat.png);
                Uint8List uint8List = byteData!.buffer.asUint8List();

                await ImageGallerySaver.saveImage(uint8List);
                },icon: Icon(Icons.download)),
            ],
          ),
          body: RepaintBoundary(
            key: _globalKey,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(300)),
                    color: Colors.amber,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                         height: 300,
                         width: 300,
                         color: Colors.white,
                         child: Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 20),
                               child: Container(
                                 height: 200,
                                 width: 130,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                   color: Colors.amber,
                                 ),
                                 child: Image.file(File("${linkedinpostModel.path}"),fit: BoxFit.cover),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 50,left: 10),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text("${linkedinpostModel.name}",style: GoogleFonts.lobster(fontSize: 30,color: Colors.brown.shade400)),
                                   SizedBox(height: 10),
                                   Text("${linkedinpostModel.qa}",style: GoogleFonts.poly(fontSize: 15,color: Colors.brown.shade400)),
                                   SizedBox(height: 10),
                                   Text("${linkedinpostModel.pr}",style: GoogleFonts.poly(fontSize: 15,color: Colors.brown.shade400)),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Icon(Icons.contacts,color: Colors.amber),
                            SizedBox(width: 3),
                            Text(" ${linkedinpostModel.mobile}",style: GoogleFonts.poly(fontSize: 20,color: Colors.brown.shade100)),
                            SizedBox(width: 25),
                            Icon(Icons.language,color: Colors.amber),
                            SizedBox(width: 5),
                            Text("www.mywebsite.com",style: GoogleFonts.poly(fontSize: 20,color: Colors.brown.shade100)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(" Profession :- ${linkedinpostModel.pr}",style: GoogleFonts.poly(fontSize: 20,color: Colors.brown.shade100)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(" E-mail :- ${linkedinpostModel.email}",style: GoogleFonts.poly(fontSize: 20,color: Colors.brown.shade100)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}