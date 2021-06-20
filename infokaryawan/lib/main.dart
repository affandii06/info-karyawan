import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infokaryawan/view/dashboard.dart';
import 'package:page_transition/page_transition.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Info Karyawan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Info Karyawan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Timer> splashscreen() async {
    return Timer(Duration(seconds: 2), nextpage);
  }

  nextpage(){
    Navigator.pushReplacement(context, PageTransition(child: Dashboard(), type: PageTransitionType.rightToLeft));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Ahmad Affandi', textStyle: GoogleFonts.poppins(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        )
      ),
    );
  }
}
