import 'package:flutter/material.dart';

import '../ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel view;

  const PhotoProvider({
    Key? key,
    required this.view,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();

    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
