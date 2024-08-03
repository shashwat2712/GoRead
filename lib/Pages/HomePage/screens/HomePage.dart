import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsflix/Model/NewsModel.dart';
import 'package:newsflix/Pages/HomePage/services/home_services.dart';
import '../../../Components/NewsTileLoading.dart';
import '../../../Components/TrendingLoadingCard.dart';
import '../../NewDetails/news_details_page.dart';
import '../Widgets/NewsTile.dart';
import '../Widgets/TrendingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> trendingNewsList = [];
  HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    getTrendingNews();
  }

  void getTrendingNews() async {
    var news = await homeServices.getTrendingNews(context: context);
    setState(() {
      print(news.length);
      print('triggereddddddddddddddddddddddddddd');
      trendingNewsList.addAll(news);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.dashboard),
              ),
              const Text(
                "NEWS APP",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.person),
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hottest News",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "See All",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 370,
            width: double.infinity,
            child: trendingNewsList.isEmpty
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      TrendingLoadingCard(),
                      TrendingLoadingCard(),
                    ],
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingNewsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TrendingCard(
                        ontap: () {
                          Get.to(
                            NewsDetailsPage(
                              news: trendingNewsList[index],
                            ),
                          );
                        },
                        imageUrl: trendingNewsList[index].image ??
                            'https://images.pexels.com/photos/518543/pexels-photo-518543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        title: trendingNewsList[index].title ?? '',
                        author: trendingNewsList[index].authors[0],
                        tag: "Trending no 1",
                        time: trendingNewsList[index].publishDate ?? '4:00',
                      );
                    },
                  ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "News For you",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "See All",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          const SizedBox(height: 20),
          trendingNewsList.isEmpty
              ? const Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: trendingNewsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    print('the index is' + index.toString());
                    return NewsTile(
                      ontap: () {
                        Get.to(NewsDetailsPage(news: trendingNewsList[index]));
                      },
                      imageUrl: trendingNewsList[index].image ??
                          "https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",
                      title: trendingNewsList[index].title,
                      author: trendingNewsList[index].authors[0],
                      time: trendingNewsList[index].publishDate,
                    );
                  },
                ),
        ],
      ),
    );
  }
}
