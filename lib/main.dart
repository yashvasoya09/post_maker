  import 'package:flutter/material.dart';
import 'package:post_maker/final/instafinal_screen.dart';
import 'package:post_maker/final/linkedinfinal_screen.dart';
import 'package:post_maker/final/simplefinal_screen.dart';
import 'package:post_maker/home/home_screen.dart';
import 'package:post_maker/home/instagram.dart';
import 'package:post_maker/home/linkedin.dart';
import 'package:post_maker/home/simple.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/':(context) => homeScreen(),
        'instaScreen':(context) => instaScreen(),
        'linkedinScreen':(context) => linkedinScreen(),
        'simpleScreen':(context) => simpleScreen(),
        'instafinalScreen':(context) => instafinalScreen(),
        'linkedinfinalScreen':(context) => linkedlinfinalScreen(),
        'simplefinalScreen':(context) => simplefinalScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
