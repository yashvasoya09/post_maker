import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_maker/home/insta%20model.dart';

class instafinalScreen extends StatefulWidget {
  const instafinalScreen({Key? key}) : super(key: key);

  @override
  State<instafinalScreen> createState() => _instafinalScreenState();
}

class _instafinalScreenState extends State<instafinalScreen> {
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
            "Instagram",
            style: GoogleFonts.styleScript(fontSize: 30),
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.pink,
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
                  child: Stack(children: [
                    Image.asset("assets/images/instafram.png"),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 80),
                          Image.file(File("${i1.path}"),height: 200,width: 200,fit: BoxFit.fitWidth),
                        ],
                      ),
                    ),
                    Column(children: [SizedBox(width: 230,),SizedBox(height: 80),Text("Your name",style: GoogleFonts.styleScript(fontSize: 25,color: Colors.purple),)],),
                    Center(child: Column(children: [SizedBox(height: 350),Text("tagline",style: GoogleFonts.styleScript(fontSize: 25,color: Colors.purple),)],))
                  ],),),
              SizedBox(height: 30),
              RadiantGradientMask(
                child: InkWell(
                  onTap: ()  {

                  },
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
        colors: [Colors.pink, Colors.purple],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
