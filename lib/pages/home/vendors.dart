import 'package:flutter/material.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vendors = [
      'Wattpad', 'Kruncel', 'Crane & Co', 'GoodDay', 'Warehouse', 'Peppa Pig',
      'JSTOR', 'Peloton', 'Haymarket'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text('Vendors', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Vendors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: vendors.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[300],
                        child: Center(child: Text(vendors[index][0])),
                      ),
                      SizedBox(height: 4),
                      Text(vendors[index], style: TextStyle(fontSize: 12)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) => Icon(Icons.star, size: 12, color: Colors.amber)),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
