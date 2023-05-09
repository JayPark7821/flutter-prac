import 'package:flutter/material.dart';

import 'main.dart';

class BucketService extends ChangeNotifier {
  List<Bucket> bucketList = [
    Bucket("dart 공부하기", false),
  ];
}
