import 'package:flutter/material.dart';
import 'dart:async';
import 'package:splashscreen/home.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(second: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        children: Column(
          mainAxisAlignment: MainAxisAligment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Icon(
            Icon.store,
            size: 100.0
            color: Colors.white,
            ),

            SizedBox(height: 24.0,),

            Text("SELAMAT DATANG DI WARUNG AJAIB",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),

          ],
        ),
      ),
    );
  }

}
