import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorites"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsApp.greyscale300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                    ),
                    title: Text(
                      "The Da vinci Code",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "\$19.99",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorsApp.primary500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.favorite,
                      color: ColorsApp.primary500,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                    ),
                    title: Text(
                      "Carrie Fisher",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "\$19.99",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorsApp.primary500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.favorite,
                      color: ColorsApp.primary500,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                    ),
                    title: Text(
                      "The Waiting",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "\$19.99",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorsApp.primary500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.favorite,
                      color: ColorsApp.primary500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
