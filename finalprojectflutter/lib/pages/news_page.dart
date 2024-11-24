import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finalprojectflutter/controller/news_controller.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());

    newsController.initializeNews();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'News',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: Image.asset(
                        'assets/images/news_image.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Kamis, 08 Maret 2021',
                      style: GoogleFonts.poppins(fontSize: 8),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Covid-19 Indonesian People',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Pada akhir tahun 2019 dunia sedang menghadapi masalah besar. Berawal dari munculnya suatu wabah penyakit yang disebabkan oleh virus corona atau yang akrab disebut Covid 19, hampir semua aspek kehidupan mengalami perubahanperubahan yang semakin hari semakin mengkhawatirkan, mendebarkan seluruh isi dunia. Covid-19 telah menjadi perhatian publik sejak kemunculannya terdeteksi di Tiongkok di kota Wuhan Provinsi Hubei untuk kali pertama di awal tahun 2020. Meninggalnya ribuan jiwa akibat virus ini membuatnya menjadi pusat perhatian banyak negara, termasuk Indonesia sehingga WHO tanggal 11 Maret 2020 menetapkan wabah ini sebagai pandemi global. Pandemi COVID-19 terbukti telah memberikan tekanan pada kondisi ekonomi dan sosial di Indonesia sejak akhir tahun 2019. Dampak ekonomi ini berdampak luas di seluruh wilayah Indonesia. Perekonomian masing-masing daerah terancam, ditambah dengan kondisi daerah yang lebih buruk dari sebelumnya. Karena hal tersebut, pemerintah Indonesia langsung mengambil langkah agresif agar angka penyebaran bisa ditekan semaksimal mungkin.',
                      textAlign: TextAlign.justify,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'Tahukah Kamu?',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'Lihat Semua',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Color(0xff52575C)),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Obx(() {
                      return Row(
                        children: [
                          for (var newsItem in newsController.newsList)
                            CustomCard(
                              imagePath: newsItem.imagePath,
                              label: newsItem.label,
                              category: newsItem.category,
                            ),
                        ],
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

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.category,
  });

  final String imagePath;
  final String label;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 180,
      width: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: 160,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    category,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xff9A9A9B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
