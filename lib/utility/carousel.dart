import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<ImageProvider> images;

  Carousel({required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: images[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}