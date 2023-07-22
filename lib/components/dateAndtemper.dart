import 'package:flutter/material.dart';

Container dateAndtemper() {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xFFff9cca),
          Color(0xFFffa59e),
          Color(0xFFffbf73),
          Color(0xFFfbe05f),
        ],
      ),
    ),
  );
}
