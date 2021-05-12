import 'package:ar_face_filters_app/cameraWithMaskFiltersScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: CameraWithMaskFiltersScreen(),
      title: Text(
        "InvitAR",
        style: TextStyle(
            fontSize: 70, color: Color(0xFFF50057), fontFamily: "Signatra"),
      ),
      image: Image.asset("images/undraw_love_xfcv 1.png"),
      backgroundColor: Color(0xFFF0C8D6),
      photoSize: 180,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "from Ha Ngoc Linh",
        style: TextStyle(
            color: Color(0xFFF50057), fontSize: 16.0, fontFamily: "Brand Bold"),
      ),
    );
  }
}
