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

                              // TODO (3): Wrap CachedNetworkImage with Hero
                              // TODO (4): Hero.tag = '${dog.name}_${entry.key}'

                              child: Hero(
                                tag: '${dog.name}_${entry.key}',
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
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.emoji_emotions_outlined),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: Text(
                            dog.temperament ?? '-',
                            style: TextStyle(fontSize: 18.0),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(FlutterIcons.timelapse_mco),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: Text(
                            dog.lifespan ?? '-',
                            style: TextStyle(fontSize: 18.0),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(FlutterIcons.clipboard_account_outline_mco),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: Text(
                            dog.bredFor ?? '-',
                            style: TextStyle(fontSize: 18.0),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(FlutterIcons.dog_mco),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: Text(
                            '${dog.breedGroup}' ?? '-',
                            style: TextStyle(fontSize: 18.0),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
