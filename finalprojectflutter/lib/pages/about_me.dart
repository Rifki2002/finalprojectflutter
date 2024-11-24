import 'package:finalprojectflutter/controller/user_controller.dart';
import 'package:finalprojectflutter/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'About Me',
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff52575C)),
              ),
              Container(
                  child: Column(
                children: [
                  Image.asset('assets/icons/profile.png'),
                  SizedBox(
                    height: 17,
                  ),
                  Text(
                    'Muhammad Rifki Yohandy',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Obx(() {
                    return Text(
                      userController.email.value, // Display email reactively
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Color(0xff929292)),
                    );
                  }),
                ],
              )),
              Container(
                height: 106,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE5E5E5)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Portfolio',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIcon(
                            text: 'Flutter',
                            imagePath: 'assets/icons/flutter.png',
                          ),
                          CustomIcon(
                            text: 'React',
                            imagePath: 'assets/icons/react.png',
                          ),
                          CustomIcon(
                            text: 'Kotlin',
                            imagePath: 'assets/icons/kotlin.png',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 106,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE5E5E5)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIcon(
                            text: 'LinkedIn',
                            imagePath: 'assets/icons/linkedin.png',
                          ),
                          CustomIcon(
                            text: 'Telegram',
                            imagePath: 'assets/icons/telegram.png',
                          ),
                          CustomIcon(
                            text: 'Gmail',
                            imagePath: 'assets/icons/gmail.png',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 106,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE5E5E5)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Courses',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIcon(
                            text: '',
                            imagePath: 'assets/icons/sanber.png',
                          ),
                          CustomIcon(
                            text: '',
                            imagePath: 'assets/icons/udemy.png',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Log out',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => LoginPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.text,
    this.imagePath,
  });
  final String? text;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        if (imagePath != null)
          Image.asset(
            imagePath!,
            fit: BoxFit.cover,
          )
        else
          Container(
            color: Colors.grey[200],
            child: Icon(
              Icons.image_not_supported,
              color: Colors.grey,
            ),
          ),
        Text(
          text!,
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff52575C)),
        )
      ],
    ));
  }
}
