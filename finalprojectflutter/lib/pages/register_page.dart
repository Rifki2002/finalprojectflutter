import 'package:finalprojectflutter/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 27, 24, 43),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/splash_image.png',
                        height: 57,
                        width: 52,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        Text(
                          'Selamat Datang\nSilahkan Mendaftar',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 47),
                    CustomTextForm(
                      text: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(height: 18),
                    CustomTextForm(
                      text: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 24),
                    CustomTextForm(
                      text: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Sudah Punya Akun? '),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/login');
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xffFF7A3F),
                              color: Color(0xffFF7A3F),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 200),
                    Obx(() {
                      return CustomButton(
                        text: registerController.isLoading.value
                            ? 'Loading...'
                            : 'Daftar',
                        bcolor: const Color(0xff1A3665),
                        onPressed: registerController.isLoading.value
                            ? null
                            : () => registerController.registerUser(
                                  emailController.text,
                                  passwordController.text,
                                ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.text,
    this.controller,
    this.obscureText = false,
  });

  final String text;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color(0xff7D8797),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 45,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffE9E9E9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.bcolor,
    this.onPressed,
  });

  final String text;
  final Color bcolor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: bcolor,
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
