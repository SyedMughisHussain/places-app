import 'dart:io';

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  Place({
    required this.id,
    required this.title,
    this.location,
    required this.image,
  });
}

class PlaceLocation {
  final double latitide;
  final double longitude;
  final String? address;

  PlaceLocation({
    required this.latitide,
    required this.longitude,
    this.address,
  });
}
