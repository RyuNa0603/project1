import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vendors = List.generate(9, (index) => '');

    final tabs = ['All', 'Books', 'Poets', 'Special for you', 'Stationery'];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.white,
          elevation: 0,
          leading: BackButton(color: ColorsApp.greyscale900),
          title:
              Text('Vendors', style: TextStyle(color: ColorsApp.greyscale900)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our vendors',
                    style: TextStyle(
                      color: ColorsApp.greyscale500,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Vendors',
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
              indicatorColor: ColorsApp.primary500,
              labelColor: ColorsApp.primary500,
              unselectedLabelColor: ColorsApp.greyscale500,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      itemCount: vendors.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 97,
                              width: 97,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorsApp.greyscale300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Logo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsApp.greyscale900),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Name',
                              style: TextStyle(
                                color: ColorsApp.greyscale900,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  5,
                                  (i) => Icon(Icons.star,
                                      size: 14, color: Colors.amber)),
                            )
                          ],
                        );
                      },
                    ),
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
