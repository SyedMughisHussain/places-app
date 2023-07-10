import 'package:flutter/material.dart';
import 'package:places_app/helpers/db_helpers.dart';

import '../models/place.dart';
import 'dart:io';

class UserPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DbHelper().insert("place", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
    });
  }

  Future<void> getAndSetList() async {
    final dataList = await DbHelper().fetchAndSetData("table");
    _items = dataList
        .map(
          (item) => Place(
              id: item['id'], title: item['title'], image: File(item['image'])),
        )
        .toList();
    notifyListeners();
  }
}
