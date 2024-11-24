import 'package:finalprojectflutter/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finalprojectflutter/pages/about_me.dart';
import 'package:finalprojectflutter/pages/news_page.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    final List<Widget> _pages = [
      HomeContent(),
      NewsPage(),
      AboutMe(),
    ];

    return Scaffold(
      body: Obx(() {
        return _pages[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Color(0xffFECD1A),
          unselectedItemColor: Color(0xff8E8E8E),
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Account',
            ),
          ],
        );
      }),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Home',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Obx(() {
                return Text(
                  'Hello, ${userController.email.value}',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                );
              }),
              SizedBox(
                height: 49,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    'assets/images/headline.png',
                    height: 144,
                    width: 287,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/icons/keanggotaan.png'),
                        Text(
                          'Keanggotaan\n ',
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/icons/scoutbook.png'),
                        Text(
                          'Pedoman\nPramuka',
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/icons/scoutact.png'),
                        Text(
                          'Kegiatan\nPramuka',
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/icons/forum.png'),
                        Text(
                          'Forum\nDiskusi',
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/icons/polling.png'),
                        Text(
                          'Survey &\nPolling',
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/icons/download.png'),
                        Text(
                          'Download\nDokumen',
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      try {
                        Get.toNamed('/contact');
                      } catch (e) {
                        print("Navigation error: $e");
                      }
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/contact.png'),
                          Text(
                            'Kontak\nPenting',
                            style: GoogleFonts.poppins(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                'Berita',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Nasional',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Text(
                            'Lihat Semua',
                            style:
                                GoogleFonts.poppins(color: Color(0xff9D5E1F)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/news.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kwarcab Kabupaten Bogor Minta...',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.48),
                                ),
                              ),
                              Text('12 April 2021',
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/news_image.png',
                            width: 51,
                            height: 53,
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selalu Jaga Jarak Covid - 19',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.48)),
                              ),
                              Text('08 Maret 2021',
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
