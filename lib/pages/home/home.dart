// import 'package:flutter/material.dart';
// import 'package:project1/core/colors_app.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           children: [
//             SizedBox(
//               width: 16,
//             ),
//             Icon(
//               Icons.search,
//               color: ColorsApp.greyscale900,
//             ),
//             SizedBox(
//               width: 101,
//             ),
//             Text(
//               "Home",
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//                 color: ColorsApp.greyscale900,
//               ),
//             ),
//             SizedBox(
//               width: 123,
//             ),
//             Icon(
//               Icons.notifications_outlined,
//               color: ColorsApp.greyscale900,
//             ),
//             SizedBox(
//               width: 8,
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             Container(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "Special Offer",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 20,
//                               color: ColorsApp.greyscale900,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 84,
//                       ),
//                       Image(
//                         image: AssetImage('assets/images/homeImage.png'),
//                         width: 99,
//                         height: 145,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Text(
                  'See all',
                  style: TextStyle(color: ColorsApp.primary500),
                )
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
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
