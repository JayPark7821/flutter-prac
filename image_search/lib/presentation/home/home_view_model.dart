import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

import '../../domain/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;
  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
