import 'package:flutter/material.dart';
import 'package:places_app/providers/user_places.dart';

import '../screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Consumer<UserPlaces>(
          child: const Center(child: Text('No Place added yet')),
          builder: (context, userPlace, ch) => ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(userPlace.items[index].image),
              ),
              title: Text(userPlace.items[index].title),
            ),
            itemCount: userPlace.items.length,
          ),
        ));
  }
}
