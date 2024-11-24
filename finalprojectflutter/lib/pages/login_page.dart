import 'package:finalprojectflutter/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 27, 24, 43),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/splash_image.png',
                  height: 57,
                  width: 52,
                ),
              ),
              const SizedBox(height: 13),
              Text(
                'Selamat Datang\nKembali',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 47),
              CustomTextForm(
                controller: _emailController,
                text: 'Email',
              ),
              const SizedBox(height: 24),
              CustomTextForm(
                controller: _passwordController,
                text: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Belum Punya Akun? '),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFF7A3F),
                        color: Color(0xffFF7A3F),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Lupa Password?',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFF7A3F),
                        color: Color(0xffFF7A3F)),
                  ),
                ],
              ),
              const Spacer(),
              Obx(() {
                return CustomButton(
                  text:
                      loginController.isLoading.value ? 'Loading...' : 'Masuk',
                  bcolor: const Color(0xff1F99CC),
                  onPressed: loginController.isLoading.value
                      ? null
                      : () => loginController.loginUser(
                            _emailController.text,
                            _passwordController.text,
                          ),
                );
              }),
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
    required this.controller,
    this.obscureText = false,
  });

  final String text;
  final TextEditingController controller;
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
                  fontSize: 16, color: const Color(0xff7D8797)),
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
  final Color? bcolor;
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
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
