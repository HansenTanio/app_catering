import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GambarCarousel extends StatelessWidget {
  GambarCarousel({super.key});
  final List<String> imagesCarousel = [
    "images/promo1.png",
    "images/promo2.png",
    "images/promo3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imagesCarousel.map((imageCarousel) {
            return Container(
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.asset(
                imageCarousel,
                fit: BoxFit.cover,
                width: double.infinity,
                //height: 150,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 150.0,
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              // Handle when the page changes
            },
          ),
        ),
      ],
    );
  }
}
