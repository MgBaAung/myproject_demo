import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  showError(String error) {
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(error)));
    });
  }
}
