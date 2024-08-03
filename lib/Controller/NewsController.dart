import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/NewsModel.dart';

class NewsController extends GetxController {

  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;

  RxBool isNewsForULoading = false.obs;
  RxBool isSpeeking = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getNewsForYou();
  }

  Future<void> getNewsForYou() async {
    isNewsForULoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=world&apiKey=e24690064c5548cba059575dd60a6f80";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        isNewsForULoading.value = false;
      } else {
      }
    } catch (ex) {
    }

  }


  Future<void> searchNews(String search) async {
    isNewsForULoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=$search&apiKey=e24690064c5548cba059575dd60a6f80";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
      }
    } catch (ex) {
    }
    isNewsForULoading.value = false;
  }


  void stop() async {
    // await flutterTts.stop();
    isSpeeking.value = false;
  }
}
