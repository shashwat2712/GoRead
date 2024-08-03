import 'package:flutter/material.dart';
import 'package:newsflix/constants/news_dummy.dart';
import 'package:newsflix/reels/widgets/reel_component.dart';

import '../../Model/NewsModel.dart';
import '../../Pages/HomePage/services/home_services.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  List<NewsModel> newsList = [];
  HomeServices homeServices = HomeServices();
  @override
  @override
  void initState() {
    super.initState();
    getTrendingNews();
  }

  void getTrendingNews() async {
    var news = await homeServices.getTrendingNews(context: context);
    setState(() {
      newsList.addAll(news);
    });
  }

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: const Image(
                image: NetworkImage(
                    'https://images.pexels.com/photos/518543/pexels-photo-518543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: newsList.isEmpty
            ? Container()
            : PageView.builder(
                itemCount: newsList.length,
                controller: PageController(initialPage: 0, viewportFraction: 1),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = newsList[index];
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        ReelComponent(
                          data: newsList[index] ,
                        ),
                        // Column(
                        //   children: [
                        //     const SizedBox(
                        //       height: 100,
                        //     ),
                        //     Expanded(
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children: [
                        //           // Expanded(
                        //           //   child: Container(
                        //           //     padding: const EdgeInsets.only(
                        //           //       left: 20,
                        //           //     ),
                        //           //     child: const Column(
                        //           //       mainAxisSize: MainAxisSize.min,
                        //           //       crossAxisAlignment: CrossAxisAlignment.start,
                        //           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //           //       children: [
                        //           //         Text(
                        //           //           'username',
                        //           //           style: TextStyle(
                        //           //             fontSize: 20,
                        //           //             color: Colors.white,
                        //           //             fontWeight: FontWeight.bold,
                        //           //           ),
                        //           //         ),
                        //           //         Text(
                        //           //           'data.caption',
                        //           //           style: TextStyle(
                        //           //             fontSize: 15,
                        //           //             color: Colors.white,
                        //           //           ),
                        //           //         ),
                        //           //         Row(
                        //           //           children: [
                        //           //             Icon(
                        //           //               Icons.music_note,
                        //           //               size: 15,
                        //           //               color: Colors.white,
                        //           //             ),
                        //           //             Text(
                        //           //               'data.songName',
                        //           //               style: TextStyle(
                        //           //                 fontSize: 15,
                        //           //                 color: Colors.white,
                        //           //                 fontWeight: FontWeight.bold,
                        //           //               ),
                        //           //             ),
                        //           //           ],
                        //           //         )
                        //           //       ],
                        //           //     ),
                        //           //   ),
                        //           // ),
                        //           Container(
                        //             width: 100,
                        //             margin: EdgeInsets.only(top: size.height / 5),
                        //             child: Column(
                        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //               children: [
                        //                 buildProfile(
                        //                   'data.profilePhoto',
                        //                 ),
                        //                 const Column(
                        //                   children: [
                        //                     InkWell(
                        //                       // onTap: () =>
                        //                       //     videoController.likeVideo(data.id),
                        //                       child: Icon(
                        //                         Icons.favorite,
                        //                         size: 40,
                        //                         color:
                        //                             // data.likes.contains(
                        //                             //     authController.user.uid)
                        //                             true ? Colors.red : Colors.white,
                        //                       ),
                        //                     ),
                        //                     SizedBox(height: 7),
                        //                     Text(
                        //                       '4',
                        //                       style: TextStyle(
                        //                         fontSize: 20,
                        //                         color: Colors.white,
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //                 Column(
                        //                   children: [
                        //                     InkWell(
                        //                       // onTap: () => Navigator.of(context).push(
                        //                       //   MaterialPageRoute(
                        //                       //     builder: (context) => CommentScreen(
                        //                       //       id: data.id,
                        //                       //     ),
                        //                       //   ),
                        //                       // ),
                        //                       child: const Icon(
                        //                         Icons.comment,
                        //                         size: 40,
                        //                         color: Colors.white,
                        //                       ),
                        //                     ),
                        //                     const SizedBox(height: 7),
                        //                     Text(
                        //                       data.toString(),
                        //                       style: const TextStyle(
                        //                         fontSize: 20,
                        //                         color: Colors.white,
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //                 Column(
                        //                   children: [
                        //                     InkWell(
                        //                       onTap: () {},
                        //                       child: const Icon(
                        //                         Icons.reply,
                        //                         size: 40,
                        //                         color: Colors.white,
                        //                       ),
                        //                     ),
                        //                     const SizedBox(height: 7),
                        //                     Text(
                        //                       data.toString(),
                        //                       style: const TextStyle(
                        //                         fontSize: 20,
                        //                         color: Colors.white,
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //                 // CircleAnimation(
                        //                 //   child: buildMusicAlbum(data.profilePhoto),
                        //                 // ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
