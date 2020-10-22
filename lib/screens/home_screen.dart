import 'dart:convert';

import 'package:dog_quotes_4/components/dog_card.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/utils/quote_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List<Dog> dogs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bark-Bark Quotes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return DogCard(
            dog: dogs[index],
          );
        },
        itemCount: dogs.length,
      ),
    );
  }
}
