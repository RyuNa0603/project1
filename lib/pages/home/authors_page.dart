import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/home/author_profile_page.dart';


class AuthorsPage extends StatelessWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authors = [
      {'name': 'John Freeman', 'desc': 'Author of the Kite Runner'},
      {'name': 'Adam Dalva', 'desc': 'Known for fiction and drama'},
      {'name': 'Abraham Verghese', 'desc': 'Medical stories & memoirs'},
      {'name': 'Tess Gunty', 'desc': 'Novelist and social issues'},
      {'name': 'Ann Napolitano', 'desc': 'Author of Dear Edward'},
      {'name': 'Hernan Diaz', 'desc': 'Pulitzer Prize nominee'},
    ];

    final tabs = ['All', 'Poets', 'Playwrights', 'Novelistts'];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.white,
          elevation: 0,
          leading: BackButton(color: ColorsApp.greyscale900),
                 title: Text(
          "Authors",
          style: TextStyle(
            color: ColorsApp.greyscale900,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
          actions: [
            Icon(Icons.search, color: ColorsApp.greyscale900),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our authors',
                    style: TextStyle(
                      color: ColorsApp.greyscale500,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Authors',
                    style: TextStyle(
                      color: ColorsApp.primary500,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              isScrollable: true,
              indicatorColor: ColorsApp.greyscale900,
              labelColor: ColorsApp.greyscale900,
              unselectedLabelColor: ColorsApp.greyscale500,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: authors.length,
                    itemBuilder: (context, index) {
                      final author = authors[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        leading: CircleAvatar(
                          backgroundColor: ColorsApp.greyscale300,
                          radius: 25,
                          child: Text(
                            author['name']![0],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorsApp.white,
                            ),
                          ),
                        ),
                        title: Text(
                          author['name']!,
                          style: TextStyle(
                            color: ColorsApp.greyscale900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          author['desc']!,
                          style: TextStyle(
                            color: ColorsApp.greyscale500,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthorProfilePage(),
                            ),
                          );
                        },
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
