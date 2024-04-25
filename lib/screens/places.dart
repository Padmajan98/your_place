import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_place/provider/user_places.dart';
import 'package:your_place/screens/add_place.dart';
import 'package:your_place/widget/place_list.dart';

class PlaceScreen extends ConsumerWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userplaces = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx)
                   => const AddPlaceScreen()));
            },
            icon: const 
            Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(places: userplaces),
      ),
    );
  }
}
