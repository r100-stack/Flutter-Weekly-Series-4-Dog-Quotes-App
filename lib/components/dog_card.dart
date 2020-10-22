import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:dog_quotes_4/screens/details_screen.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({this.dog});

  @override
  Widget build(BuildContext context) {
    print(dog.imageUrls);

    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailsScreen(dog: dog,))),
      child: Card(
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
      ),
    );

    // return Container(
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         flex: 3,
    //         child: Image(
    //           width: 100.0,
    //           height: 100.0,
    //           image: NetworkImage(dogImage),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       Expanded(
    //         flex: 7,
    //         child: Column(
    //           children: [
    //             Text(
    //               'German Shepherd',
    //               style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
    //             ),
    //             const SizedBox(height: 5.0),
    //             Text(
    //               'When life gives you lemons, make orange juice, cuz... who cares',
    //               style: TextStyle(
    //                 fontSize: 14.0,
    //                 fontWeight: FontWeight.w400
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    // Image(
    //   width: 100.0,
    //   height: 100.0,
    //   image: NetworkImage(dogImage),
    //   fit: BoxFit.cover,
    // ),
    // const SizedBox(
    //   width: 20.0,
    // ),
    // Column(
    //   children: [
    //     Text(
    //       'German Shepherd',
    //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    //     ),
    //     const SizedBox(height: 20.0),
    //     Text('When life gives you lemons, make orange juice, cuz... who cares')
    //   ],
    // )
    // ]
    // ,
    // )
    // ,
    // );
  }
}
