import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List <Color>InstaColorList = [
    Colors.pink,
    Colors.purple,
  ];
  List <Color>bgColorList = [
    Colors.red,
    Colors.indigo,
  ];
  List <Color>LinkColorList = [
    Colors.blue,
    Colors.blueGrey,
  ];
  List <Color>SimpleColorList = [
    Colors.black,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Expanded(
            child: Container(
              width: 500,
              height: 800,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: bgColorList)),
              child: Column(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'instaScreen');
                    },
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: InstaColorList)),
                      child: Center(child: Text("Instagram Post",style: GoogleFonts.styleScript(fontSize: 30))),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'linkedinScreen');
                    },
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: LinkColorList)),
                      child: Center(child: Text("LInkdIn",style: GoogleFonts.oswald(fontSize: 30))),

                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(onTap: () {
                    Navigator.pushNamed(context, 'simpleScreen');

                  },
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: SimpleColorList)),
                      child: Center(child: Text("Simple",style: GoogleFonts.majorMonoDisplay( fontSize: 30))),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
