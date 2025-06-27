import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/home/vendors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showBookDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 6,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 140,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('The Kite Runner',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.greyscale900)),
            Text('GoodDay',
                style: TextStyle(
                    color: ColorsApp.primary500, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.',
              style: TextStyle(color: ColorsApp.greyscale700),
            ),
            SizedBox(height: 12),
            Text('Review',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Row(
                  children: List.generate(
                    4,
                    (index) => Icon(Icons.star, size: 20, color: Colors.amber),
                  )..add(Icon(Icons.star,
                      size: 20, color: ColorsApp.greyscale400)),
                ),
                SizedBox(width: 8),
                Text('(4.0)', style: TextStyle(color: ColorsApp.greyscale700))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.greyscale300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove, size: 18),
                      SizedBox(width: 8),
                      Text('1'),
                      SizedBox(width: 8),
                      Icon(Icons.add, size: 18),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Text('\$39.99',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorsApp.primary500)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.primary500),
                    child: Text('Continue shopping'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorsApp.primary500),
                    ),
                    child: Text('View cart'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(
                  color: ColorsApp.greyscale900, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        leading: Icon(Icons.search, color: ColorsApp.greyscale900),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: ColorsApp.greyscale900),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColorsApp.primary50,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Special Offer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorsApp.greyscale900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Discount 25%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorsApp.greyscale900,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.primary500,
                          ),
                          child: Text('Order Now',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 80,
                    height: 120,
                    color: ColorsApp.greyscale500,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top of Week',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  child: Text(
                    'See all',
                    style: TextStyle(color: ColorsApp.primary500),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VendorsPage(),
                      ),
                      (route) => false,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _showBookDetail(context),
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          color: Colors.orange[100],
                        ),
                        SizedBox(height: 8),
                        Text('Book Title',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        Text('\$14.99'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Vendors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: ColorsApp.primary500),
                )
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  width: 100,
                  margin: EdgeInsets.only(right: 12),
                  color: ColorsApp.greyscale500,
                  alignment: Alignment.center,
                  child: Text('Logo'),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Authors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: ColorsApp.primary500),
                )
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorsApp.greyscale400,
                      ),
                      SizedBox(height: 8),
                      Text('Author Name'),
                      Text(
                        'Writer',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorsApp.greyscale500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: ColorsApp.primary500,
        unselectedItemColor: ColorsApp.greyscale500,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
