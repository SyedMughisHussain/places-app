import 'package:flutter/material.dart';

import './screens/places_list_screen.dart';
import './providers/user_places.dart';
import 'package:provider/provider.dart';
import './screens/add_place_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserPlaces(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.purple[800],
            appBarTheme: const AppBarTheme(
                //centerTitle: true,
                elevation: 4,
                backgroundColor: Color.fromARGB(255, 75, 18, 85)

                //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                //useMaterial3: true,
                ),
          ),
          home: const PlaceListScreen(),
          routes: {
            AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
          },
        ));
  }
}
