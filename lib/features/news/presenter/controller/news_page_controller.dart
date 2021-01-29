import 'package:flutter/cupertino.dart';

import '../../../../config/instance_factory.dart';
import '../../domain/entities/news.dart';
import '../../domain/usecases/get_all_news.dart';

class NewsPageController {
  final newsList = ValueNotifier<List<NewsItem>>([]);
  final GetAllNews _getAllNews = InstanceFactory.get<GetAllNews>();

  void getListAllNews() async {
    newsList.value = await _getAllNews();
  }
}
