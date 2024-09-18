import 'package:flutter/material.dart';
import 'package:tractian_challenge/app.dart';
import 'package:tractian_challenge/core/di/setup_di.dart';

void main() {
  setupDi();
  runApp(
    const App(),
  );
}
