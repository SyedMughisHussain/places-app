import 'package:flutter/material.dart';

import 'package:location/location.dart';

class LocationInputWidget extends StatefulWidget {
  const LocationInputWidget({super.key});

  @override
  State<LocationInputWidget> createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String? _imageInputUrl;

  Future<void> _getLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          child: _imageInputUrl!.isEmpty
              ? const Text('No Location Chosen')
              : Image.network(
                  _imageInputUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: _getLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('Current Location')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                label: const Text('Choose from map')),
          ],
        ),
      ],
    );
  }
}
