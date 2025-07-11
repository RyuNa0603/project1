import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/category/search.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // final List<Map<String, dynamic>> books = const [
  //   {
  //     'title': 'The Da Vinci Code',
  //     'price': '\$19.99',
  //     'image': 'https://upload.wikimedia.org/wikipedia/en/6/6b/DaVinciCode.jpg'
  //   },
  //   {
  //     'title': 'Carrie Fisher',
  //     'price': '\$27.12',
  //     'image': 'https://upload.wikimedia.org/wikipedia/en/2/2f/Postcards_from_the_Edge_book_cover.jpg'
  //   },
  //   {
  //     'title': 'The Good Sister',
  //     'price': '\$27.12',
  //     'image': 'https://upload.wikimedia.org/wikipedia/en/0/07/The_Good_Sister_book_cover.jpg'
  //   },
  //   {
  //     'title': 'The Waiting',
  //     'price': '\$27.12',
  //     'image': 'https://upload.wikimedia.org/wikipedia/en/f/f4/The_Waiting_book_cover.jpg'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.tune, color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All"),
                Text("Novels"),
                Text("Self Love"),
                Text("Science"),
                Text("Romantic"),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                // final book = books[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        color: ColorsApp.greyscale900,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'title',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'price',
                              style: TextStyle(color: ColorsApp.primary500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
