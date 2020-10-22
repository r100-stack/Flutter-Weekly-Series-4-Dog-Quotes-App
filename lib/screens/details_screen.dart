import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailsScreen extends StatelessWidget {
  final Dog dog;

  const DetailsScreen({this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColorLight,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 2, milliseconds: 500),
                ),
                items: dog.imageUrls
                    .asMap()
                    .entries
                    .map((entry) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Align(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: entry.value,
                                placeholder: (context, url) => Center(
                                  child: Container(
                                    height: 25.0,
                                    width: 25.0,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),

              // TODO (1): Padding.child = Column()

              // Within Column.children
              // TODO (2): Add a Text() for the Dog's name
              // TODO (3): Text.textAlign = TextAlign.center
              // TODO (4): Text.style = 30.0, FontWeight.w600
              // Text(
              //   dog.name ?? '-',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 30.0,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),

              // TODO (5): Add a SizedBox of height 5.0

              // TODO (6): Add a Text() for the Dog's quote
              // TODO (7): Text.textAlign = TextAlign.center
              // TODO (8): Text.style = 18.0, FontWeight.w300
              // Text(
              //   dog.quote ?? '-',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.w300,
              //   ),
              // ),

              // TODO (9): Add a SizedBox of height 20.0

              // TODO (11): Add a Row for the Dog's origin
              // Within Row.children
              // TODO (12): Icon(md_globe_icon) | SizedBox(width: 10.0) | Text
              // TODO (13): Text.style = 18.0
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(FlutterIcons.md_globe_ion),
              //     const SizedBox(
              //       width: 10.0,
              //     ),
              //     Text(
              //       dog.origin ?? '-',
              //       style: TextStyle(fontSize: 18.0),
              //     )
              //   ],
              // ),

              // TODO (14): Add a SizedBox of height 20.0

              // TODO (15): Add a Row for the height and weight

              // Within Row.children

              // 1. TODO (16): Create a Row for the height
              // TODO (17): Icon(height) | SizedBox(width: 10.0) | Text(dog.height != null ? '${dog.height} ft' : '-')
              // TODO (18): Text.style = 18.0

              // 2. TODO (19): Create a Row for the weight
              // TODO (20): Icon(weight) | SizedBox(width: 10.0) | Text(dog.weight != null ? '${dog.weight} ft' : '-')
              // TODO (21): Text.style = 18.0

              // TODO (22): For the outer most Row, set mainAxisAlignment = MainAxisAlignment.spaceEvenly

              child: Column(
                children: [
                  Text(
                    dog.name ?? '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    dog.quote ?? '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FlutterIcons.md_globe_ion),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        dog.origin ?? '-',
                        style: TextStyle(fontSize: 18.0),
                      )
                      // Text()
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.height),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            dog.height != null ? '${dog.height} ft' : '-',
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(FlutterIcons.weight_faw5s),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            dog.weight != null ? '${dog.weight} lb' : '-',
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
