import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/screens/details_screen.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({this.dog});

  @override
  Widget build(BuildContext context) {
    // TODO (1): Delete the Container.
    // TODO (2): Return Card
    // TODO (3): Card.child = ListTile
    // TODO (5): ListTile.leading = CachedNetworkImage()

    // TODO (6): CachedNetworkImage.width = 100
    // TODO (7): CachedNetworkImage.fit = BoxFit.cover
    // TODO (8): CachedNetworkImage.imageUrl = dog.imageUrls[0]
    // TODO (9): CachedNetworkImage.placeholder = Centered CircularProgressIndicator of size 25x25
    // placeholder: (context, url) => Center(
    //   child: Container(
    //     height: 25.0,
    //     width: 25.0,
    //     child: CircularProgressIndicator(),
    //   ),
    // ),
    // TODO (10): CachedNetworkImage.errorWidget = Icon(Icons.broken_image)
    // errorWidget: (context, url, error) => Icon(Icons.broken_image),

    // TODO (11): ListTile.title = Text(dog.name)
    // TODO (12): ListTile.subtitle = Text(dog.quote)

    // TODO (13): Wrap the ListTile with a symmetric vertical padding of 20.0

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: CachedNetworkImage(
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
          title: Text(dog.name),
          subtitle: Text(dog.quote),
        ),
      ),
    );
  }
}
