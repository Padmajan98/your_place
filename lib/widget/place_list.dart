import 'package:flutter/material.dart';
import 'package:your_place/modal/place.dart';
import 'package:your_place/screens/places_details.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No Place Added yet...!',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(leading: CircleAvatar(radius: 26,
          backgroundImage: FileImage(places[index].image)),
          title: Text(places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder:
                 (ctx)=>PlaceDetailScreen(place: places[index]),),);
            },
        );
      },
    );
  }
}
