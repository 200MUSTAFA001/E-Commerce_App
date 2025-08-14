import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration duration;
  Timer? timer;

  Debouncer({required this.duration});

  void run(VoidCallback callback) {
    timer?.cancel();
    timer = Timer(duration, callback);
  }

  void dispose() {
    timer?.cancel();
  }
}
