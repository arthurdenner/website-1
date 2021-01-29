import 'package:flutter/material.dart';

import '../../../../core/widgets/responsive_list.dart';
import '../../domain/entities/news.dart';
import '../controller/news_page_controller.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsPageController _pageController = NewsPageController();

  @override
  void initState() {
    super.initState();
    _pageController.getListAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<NewsItem>>(
      valueListenable: _pageController.newsList,
      builder: (context, value, child) {
        return ResponsiveList(
          child: value.map((newsItem) => NewsCard(newsItem: newsItem)).toList(),
        );
      },
    );
  }
}
