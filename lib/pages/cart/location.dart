import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/functions/appBarr.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int? selectedIndex = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appbarr(title: "Location"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              width: 327,
              height: 223,
              color: ColorsApp.primary200,
            ),
            SizedBox(
              height: 53,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Detail Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.greyscale900,
                  ),
                ),
                Icon(
                  Icons.gps_fixed,
                  color: ColorsApp.primary500,
                  size: 22,
                ),
              ],
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: ColorsApp.primary500,
                  size: 40,
                ),
                onPressed: () {},
              ),
              title: Text(
                "Utama Street No.20",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ColorsApp.greyscale900,
                ),
              ),
              subtitle: Text(
                "Dumbo Street No.20, Dumbo, New York 10001, United States",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ColorsApp.greyscale500,
                ),
              ),
            ),
            Divider(),
            Text(
              "Save Address As",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: selectedIndex == 0
                          ? ColorsApp.primary500
                          : ColorsApp.greyscale200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Text(
                    'Offices',
                    style: TextStyle(
                      color: selectedIndex == 1
                          ? ColorsApp.primary500
                          : ColorsApp.greyscale200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
