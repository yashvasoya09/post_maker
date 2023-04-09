import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/insta model.dart';

class linkedlinfinalScreen extends StatefulWidget {
  const linkedlinfinalScreen({Key? key}) : super(key: key);

  @override
  State<linkedlinfinalScreen> createState() => _linkedlinfinalScreenState();
}

class _linkedlinfinalScreenState extends State<linkedlinfinalScreen> {
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
            "LinkedIn",
            style: GoogleFonts.oswald(fontSize: 30),
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.indigo,
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
                              height: 250, width: 270, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/linkedinframe.png"),
                    Column(
                      children: [
                        SizedBox(
                          width: 250,
                        ),
                        SizedBox(height: 80),
                        Text(
                          "Your name",
                          style: GoogleFonts.oswald(
                              fontSize: 25, color: Colors.red),
                        )
                      ],
                    ),
                    Center(
                        child: Column(
                      children: [
                        SizedBox(height: 360),
                        Text(
                          "tagline",
                          style: GoogleFonts.oswald(
                              fontSize: 25, color: Colors.red),
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
        colors: [Colors.red, Colors.indigo],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
