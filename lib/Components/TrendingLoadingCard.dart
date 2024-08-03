import 'package:flutter/material.dart';
import 'LoadingContainer.dart';

class TrendingLoadingCard extends StatelessWidget {
  const TrendingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(children: [
        LoadingContainer(
          width: MediaQuery.of(context).size.width,
          height: 200,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoadingContainer(
              width: MediaQuery.of(context).size.width / 4,
              height: 10,
            ),
            LoadingContainer(
              width: MediaQuery.of(context).size.width / 5,
              height: 10,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoadingContainer(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 20,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoadingContainer(
              width: MediaQuery.of(context).size.width / 2 - 0.2,
              height: 20,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const LoadingContainer(
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            LoadingContainer(
              width: MediaQuery.of(context).size.width / 2,
              height: 20,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ]),
    );
  }
}
