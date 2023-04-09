import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_maker/home/insta%20model.dart';

class simplefinalScreen extends StatefulWidget {
  const simplefinalScreen({Key? key}) : super(key: key);

  @override
  State<simplefinalScreen> createState() => _simplefinalScreenState();
}

class _simplefinalScreenState extends State<simplefinalScreen> {
  @override
  Widget build(BuildContext context) {
    instaModel i1 = ModalRoute.of(context)!.settings.arguments as instaModel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: GradientText(
            "Simple",
            style: GoogleFonts.majorMonoDisplay(fontSize: 30),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.yellow,
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                height: 400,
                width: 400,
                color: Colors.black,
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Image.file(File("${i1.path}"),
                              height: 230, width: 250, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/simpleframe.png"),
                    Column(
                      children: [
                        SizedBox(
                          width: 220,
                        ),
                        SizedBox(height: 50),
                        Text(
                          "Your Name",
                          style: GoogleFonts.majorMonoDisplay(
                              fontSize: 25, color: Colors.amber),
                        )
                      ],
                    ),
                    Center(
                        child: Column(
                          children: [
                            SizedBox(height: 360),
                            Text(
                              "tagline",
                              style: GoogleFonts.majorMonoDisplay(
                                  fontSize: 25, color: Colors.amber),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30),
              RadiantGradientMask(
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.download,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Colors.black, Colors.yellow],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

