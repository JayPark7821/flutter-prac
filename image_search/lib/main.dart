import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/data/pixaby_api.dart';
import 'package:image_search/ui/home_screen.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PhotoProvider(
          view: HomeViewModel(PixabayApi()),
          child: const HomeScreen(),
        ));
  }
}
