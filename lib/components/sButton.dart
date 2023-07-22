import 'package:flutter/material.dart';

Container sButton() {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xFFfb4e4e),
          Color(0xFFfd5382),
        ],
      ),
      image: DecorationImage(
        image: AssetImage('assets/icons/slogo.png'),
      ),
    ),
  );
}
