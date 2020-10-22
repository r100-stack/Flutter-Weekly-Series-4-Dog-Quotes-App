import 'package:carousel_slider/carousel_slider.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Dog dog;

  const DetailsScreen({this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Theme.of(context).primaryColorLight,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  // viewportFraction: .85,
                  // enlargeCenterPage: true
                ),
                items: dog.imageUrls
                    .map((imageUrl) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
