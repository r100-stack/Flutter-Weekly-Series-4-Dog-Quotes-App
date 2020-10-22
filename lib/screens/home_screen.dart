import 'dart:convert';

import 'package:dog_quotes_4/components/dog_card.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/utils/quote_utils.dart';
import 'package:flutter/material.dart';

// TODO (6): Import the http.dart file as http
import 'package:http/http.dart' as http;

// TODO (1): Convert to stateful widget
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Dog> dogs = [];

  // TODO (2): Override initState()
  // TODO (3): Create an async method called _downloadDogInfo()
  // TODO (4): Call _downloadDogInfo() inside of initState()

  @override
  void initState() {
    _downloadDogInfo();
  }

  // Within _downloadDogInfo()
  // TODO (7): try {} finally {}
  // TODO (8): Create a http.Client called client
  // try {
  // TODO (9): Send an API request to get the list of dog breeds.
  // String apiUrl = 'https://api.thedogapi.com/v1/breeds';
  // http.Response response = await client.get(apiUrl);
  // var body = jsonDecode(response.body);
  //
  // TODO (10): Create a List<Dog> called tempDogs
  // List<Dog> tempDogs = [];
  // TODO (11): Traverse through the list of dogs
  // for (var dogJson in body) {
  //   TODO (12): Print dogJson['id'];
  //   print(dogJson['id']);
  //
  //   TODO (13): Send a request to the API for the images of dog with id = dogJson['id']
  //   String imageApiUrl =
  //             'https://api.thedogapi.com/v1/images/search?breed_id=${dogJson['id']}&include_breeds=false&limit=50';
  //   http.Response imageResponse = await client.get(imageApiUrl);
  //   var imageBody = jsonDecode(imageResponse.body);
  //
  //   TODO (14): Iterate through the image JSON objects to get a list of String with imageUrls.
  //   List<String> images = [];
  //   for (var imageJson in imageBody) {
  //     images.add(imageJson['url']);
  //   }
  //
  //   TODO (15): Add the Dog with its associated fields to tempDogs
  //   tempDogs.add(Dog(
  //     name: dogJson['name'],
  //     quote: '"${QuoteUtils.getRandomQuote()}"',
  //     bredFor: dogJson['bred_for'],
  //     breedGroup: dogJson['breed_group'],
  //     lifespan: dogJson['life_span'],
  //     height: dogJson['height']['imperial'],
  //     weight: dogJson['weight']['imperial'],
  //     origin: dogJson['origin'],
  //     temperament: dogJson['temperament'],
  //     imageUrls: images,
  //   ));
  //
  //   TODO (16): Call setState() with dogs = tempDogs
  //   setState(() {
  //     dogs = tempDogs;
  //   });
  // }
  // } finally {
  // TODO (17): Close the client
  // client.close();
  // }

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
