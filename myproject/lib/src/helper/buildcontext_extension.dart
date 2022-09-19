import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  showError(String error) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(error)));
  }
}
