import 'package:flutter/material.dart';
import 'package:post/post_screen/linkedin_post/linkdin_input.dart';
import 'package:post/post_screen/linkedin_post/linkedin_output.dart';
import 'package:post/post_screen/post_home.dart';
import 'package:post/post_screen/post_maker/insta_post.dart';
import 'package:post/post_screen/post_maker/output_screen.dart';
import 'package:post/post_screen/post_plash.dart';
import 'package:post/post_screen/simpal/sim_output.dart';
import 'package:post/post_screen/simpal/simpal_input.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => Post_Plash(),
        "home":(context) =>Home_Screen(),
        "insta":(context) => InstaPost(),
        "instapost":(context) => OutputScreen(),
        "linkedinpost":(context) => LinkeDinPost(),
        "linkoutput":(context) => LinkeDin_Output(),
        "simpalinput":(context) => Simpal_Screen(),
        "simpaloutput":(context) => SimpalOutput(),
      },
    ),
  );
}