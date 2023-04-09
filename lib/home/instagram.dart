import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_maker/home/insta%20model.dart';
class instaScreen extends StatefulWidget {
  const instaScreen({Key? key}) : super(key: key);

  @override
  State<instaScreen> createState() => _instaScreenState();
}

class _instaScreenState extends State<instaScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txttagline = TextEditingController();
  final ImagePicker picker = ImagePicker();
  String? path;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              // CircleAvatar(radius: 70,backgroundColor: Colors.purple,backgroundImage: FileImage(File("${path}"))),
              path == null
                  ? CircleAvatar(
                      backgroundColor: Colors.black,
                      child: RadiantGradientMask(
                          child: Icon(
                        Icons.person,
                        size: 80,
                      )),
                      radius: 100,
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: FileImage(File("${path}")),
                      radius: 100,
                    ),
              GradientText(
                "Enter Our Photo",
                style: GoogleFonts.styleScript(fontSize: 25),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.pink,
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadiantGradientMask(
                    child: InkWell(
                      onTap: () async {
                        XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          path = photo!.path;
                        });
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  RadiantGradientMask(
                    child: InkWell(
                      onTap: () async {
                        XFile? photo =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          path = photo!.path;
                        });
                      },
                      child: Icon(
                        Icons.photo,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              GradientText(
                "Enter Our Name",
                style: GoogleFonts.styleScript(fontSize: 25),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.pink,
                  ],
                ),
              ),
              SizedBox(height: 10),
              Gradienttextfield(
                controller: txtname,
                radius: 40,
                height: 50,
                width: 400,
                colors: [Colors.pink, Colors.purple],
                text: "Enter Name",
                fontColor: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: 20),
              GradientText(
                "Enter our Tagline",
                style: GoogleFonts.styleScript(fontSize: 25),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.pink,
                  ],
                ),
              ),
              SizedBox(height: 10),
              Gradienttextfield(
                controller: txttagline,
                radius: 40,
                height: 50,
                width: 400,
                colors: [Colors.pink, Colors.purple],
                text: "Enter Tagline",
                fontColor: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: 20),
              RadiantGradientMask(
                child: InkWell(
                  onTap: () {
                    instaModel i1 = instaModel();
                    i1 = instaModel(path: path);
                    Navigator.pushNamed(context, 'instafinalScreen',arguments: instaModel(path: path));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      Icons.save,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
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
