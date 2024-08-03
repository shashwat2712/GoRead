import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newsflix/Components/error_handling.dart';
import 'package:newsflix/Model/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:newsflix/constants/utils.dart';

class HomeServices {
  Future<List<NewsModel>> getTrendingNews(
      {required BuildContext context}) async {
    List<NewsModel> trendingNewsList = [];
    try {
      var baseURL = "http://127.0.0.1:8000/get-latest-news-dummy";
      var response = await http.get(
        Uri.parse(baseURL),
      );
      print(response.body);
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          var body = jsonDecode(response.body);
          List articles = body['latest_news'];
          for (var news in articles) {
            trendingNewsList.add(NewsModel.fromJson(news));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return trendingNewsList;
  }

  Future<List<NewsModel>> getCustomizedNews(
      {required BuildContext context, required String query}) async {
    List<NewsModel> trendingNewsList = [];
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e24690064c5548cba059575dd60a6f80";
      var response = await http.get(Uri.parse(baseURL));

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          var body = jsonDecode(response.body);
          List articles = body['articles'];
          for (var news in articles) {
            trendingNewsList.add(NewsModel.fromJson(news));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString()+'heree it is');
    }

    return trendingNewsList;
  }
}
