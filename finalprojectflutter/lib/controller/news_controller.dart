import 'package:get/get.dart';

class NewsItem {
  final String imagePath;
  final String label;
  final String category;

  NewsItem({
    required this.imagePath,
    required this.label,
    required this.category,
  });
}

class NewsController extends GetxController {
  var newsList = <NewsItem>[].obs;

  void addNews(NewsItem newsItem) {
    newsList.add(newsItem);
  }

  void initializeNews() {
    if (newsList.isEmpty) {
      addNews(NewsItem(
        imagePath: 'assets/images/news_image.png',
        label: 'Selalu jaga jarak covid-19',
        category: 'Kamis, 08 Maret 2021',
      ));

      addNews(NewsItem(
        imagePath: 'assets/images/covid_news.png',
        label: 'Masih yakin dengan covid-19?',
        category: 'Jum\'at, 22 Maret 2021',
      ));
    }
  }
}
