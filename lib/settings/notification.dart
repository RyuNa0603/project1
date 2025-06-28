import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'October 2021',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Promotion',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorsApp.primary500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Today 50% discount on all Books in Novel category with online orders worldwide.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promotion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorsApp.primary500,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Oct 08 20.30',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorsApp.greyscale500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Buy 2 get 1 free for since books from 08 - 10 October 2021.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'September 2021',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: ColorsApp.greyscale900,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Sept 16 11.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorsApp.greyscale500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'There is a new book now are available ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
