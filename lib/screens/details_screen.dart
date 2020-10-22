import 'package:dog_quotes_4/models/dog.dart';
import 'package:flutter/material.dart';

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
              height: 250.0,
              color: Theme.of(context).primaryColorLight,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
