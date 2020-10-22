import 'dart:convert';

import 'package:dog_quotes_4/components/dog_card.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/utils/quote_utils.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Dog> dogs = [];

  @override
  void initState() {
    _downloadDogInfo();
  }

  _downloadDogInfo() async {
    http.Client client = http.Client();

    try {
      String apiUrl = 'https://api.thedogapi.com/v1/breeds';
      http.Response response = await client.get(apiUrl);
      var body = jsonDecode(response.body);

      List<Dog> tempDogs = [];
      for (var dogJson in body) {
        print(dogJson['id']);

        String imageApiUrl =
            'https://api.thedogapi.com/v1/images/search?breed_id=${dogJson['id']}&include_breeds=false&limit=50';
        http.Response imageResponse = await client.get(imageApiUrl);
        var imageBody = jsonDecode(imageResponse.body);

        List<String> images = [];
        for (var imageJson in imageBody) {
          images.add(imageJson['url']);
        }

        tempDogs.add(Dog(
          name: dogJson['name'],
          quote: '"${QuoteUtils.getRandomQuote()}"',
          bredFor: dogJson['bred_for'],
          breedGroup: dogJson['breed_group'],
          lifespan: dogJson['life_span'],
          height: dogJson['height']['imperial'],
          weight: dogJson['weight']['imperial'],
          origin: dogJson['origin'],
          temperament: dogJson['temperament'],
          imageUrls: images,
        ));
      }

      setState(() {
        dogs = tempDogs;
      });
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bark-Bark Quotes'),
        backgroundColor: Colors.brown,
      ),
      body: dogs.length != 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                return DogCard(
                  dog: dogs[index],
                );
              },
              itemCount: dogs.length,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
