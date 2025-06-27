import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

void CardBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorsApp.greyscale200),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[900],
                    radius: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'KNET',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.greyscale900,
                    ),
                  ),
                  SizedBox(
                    width: 166,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorsApp.greyscale200),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber[400],
                    radius: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Credit Card',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.greyscale900,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
