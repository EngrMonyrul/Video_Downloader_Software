import 'package:flutter/material.dart';

Center ImageBioArea() {
  return Center(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.red.shade700,
              width: 2,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/PhotoFix_1671541656859.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          left: 5,
          child: Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.green.shade700,
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/dpd.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: -20,
          left: 85,
          child: Text(
            'Monirul Islam',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Positioned(
          bottom: -33,
          left: 85,
          child: Text(
            'B.Sc Engineer',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
  );
}
