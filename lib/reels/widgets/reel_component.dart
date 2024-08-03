import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsflix/Model/NewsModel.dart';

class ReelComponent extends StatelessWidget {
  final NewsModel? data;
  const ReelComponent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new),
                    Text("Back"),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Container(
            // height: 330,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      data?.image ??
                          "https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data?.title ?? 'Dummy',
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(

                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  "${data?.title} * ${data?.publishDate}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red,
                child: Text(

                  (data!.authors?.isNotEmpty ?? false)
                      ? data!.authors![0]
                      : 'A', // Default value if `author` is null or empty
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  data?.authors![0] ?? 'Unknown',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.primaryContainer,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   // height: 30,
          //   child: Row(
          //     children: [
          //       Obx(
          //             () => newsController.isSpeeking.value
          //             ? IconButton(
          //           onPressed: () {
          //             newsController.stop();
          //           },
          //           icon: const Icon(
          //             Icons.stop,
          //             size: 50,
          //           ),
          //         )
          //             : IconButton(
          //           onPressed: () {
          //             // newsController.speak(
          //             //     news.description ?? "No Description");
          //           },
          //           icon: const Icon(
          //             Icons.play_arrow_rounded,
          //             size: 50,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //           child: Obx(
          //                 () => Lottie.asset(
          //               'Assets/Animation/wave.json',
          //               height: 70,
          //               animate: newsController.isSpeeking.value,
          //             ),
          //           ))
          //
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: Text(
                  data?.summary ?? "No Description",
                
                  style: TextStyle(
                
                
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
