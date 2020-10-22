import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/screens/details_screen.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({this.dog});

  @override
  Widget build(BuildContext context) {
    // TODO (18): Container.child = Text(dog.name)
    return Container(
      child: Text(dog.name),
    );
  }
}
