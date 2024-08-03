import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../Controller/NewsController.dart';
import '../../HomePage/Widgets/NewsTile.dart';
import '../../NewDetails/news_details_page.dart';
import '../Widgets/SearchWidget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SearchWidget(),
              const SizedBox(height: 20),
              Obx(
                () => Column(
                  children: newsController.newsForYouList
                      .map(
                        (e) => NewsTile(
                          ontap: () {
                            Get.to(NewsDetailsPage(news: e));
                          },
                          imageUrl: e.image ??
                              "https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/01/16/317_1705413514.jpg",
                          title: e.title!,
                          author: e.authors![0] ?? "Unknown",
                          time: e.publishDate!,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
