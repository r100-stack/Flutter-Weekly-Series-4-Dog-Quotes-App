import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/screens/details_screen.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({this.dog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailsScreen(dog: dog,))),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(

            // TODO (1): Wrap CachedNetworkImage with Hero
            // TODO (2): Hero.tag = '${dog.name}_0'

            leading: Hero(
              tag: '${dog.name}_0',
              child: CachedNetworkImage(
                width: 100.0,
                fit: BoxFit.cover,
                imageUrl: dog.imageUrls[0],
                placeholder: (context, url) => Center(
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.broken_image),
              ),
            ),
            title: Text(dog.name),
            subtitle: Text(dog.quote),
          ),
        ),
      ),
    );
  }
}
