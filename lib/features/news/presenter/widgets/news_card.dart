import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key key, this.newsItem}) : super(key: key);
  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(newsItem.title),
        subtitle: Text(newsItem.pubDate.toString()),
        leading: Text(newsItem.type),
        onTap: () => launch(newsItem.link),
      ),
    );
  }
}
