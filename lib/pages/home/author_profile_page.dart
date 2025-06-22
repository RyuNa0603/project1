import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class AuthorProfilePage extends StatefulWidget {
  const AuthorProfilePage({super.key});

  @override
  State<AuthorProfilePage> createState() => _AuthorProfilePageState();
}

class _AuthorProfilePageState extends State<AuthorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 24,
          color: ColorsApp.greyscale900,
        ),
        title: Text(
          "Authors",
          style: TextStyle(
            color: ColorsApp.greyscale900,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: ColorsApp.primary500,
                  radius: 55,
                ),
                Text(
                  "Novelist",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.greyscale900,
                  ),
                ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.greyscale900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 28,
                      color: ColorsApp.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 28,
                      color: ColorsApp.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 28,
                      color: ColorsApp.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 28,
                      color: ColorsApp.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 28,
                      color: ColorsApp.greyscale900,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "About",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.greyscale900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Gunty was born and raised in South Bend, Indiana.She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.greyscale600,
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Products",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.greyscale900,
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorsApp.greyscale100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsApp.greyscale300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Cover',
                                  style: TextStyle(
                                    color: ColorsApp.greyscale700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Book Title',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorsApp.primary500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
