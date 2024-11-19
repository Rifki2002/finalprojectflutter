import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_image.png',
              height: 136,
              width: 143,
            ),
            Text('Flutter Final Project',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
