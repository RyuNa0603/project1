import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/cubits_&_states/cubits/counter_cubit.dart';
import 'package:project1/pages/home/vendors.dart';

class BottomHome extends StatefulWidget {
  const BottomHome({super.key});

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  bool isPressed = false;

  // void _showBookDetail(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  //     ),  
  //     isScrollControlled: true,
  //     builder: (context) => SingleChildScrollView(
  //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Center(
  //             child: Container(
  //               width: 60,
  //               height: 6,
  //               margin: EdgeInsets.only(bottom: 16),
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(3),
  //               ),
  //             ),
  //           ),
  //           Center(
  //             child: Container(
  //               width: 140,
  //               height: 200,
  //               decoration: BoxDecoration(
  //                 color: Colors.orange[100],
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 'The Kite Runner',
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w700,
  //                   color: ColorsApp.greyscale900,
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   setState(() {
  //                     isPressed = !isPressed;
  //                   });
  //                 },
  //                 child: Icon(
  //                   Icons.favorite,
  //                   color: isPressed
  //                       ? ColorsApp.primary500
  //                       : ColorsApp.greyscale200,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Text(
  //             'GoodDay',
  //             style: TextStyle(
  //               color: ColorsApp.primary500,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //           SizedBox(height: 8),
  //           Text(
  //             'Lorem ipsum dolor sit amet...',
  //             style: TextStyle(color: ColorsApp.greyscale700),
  //           ),
  //           SizedBox(height: 12),
  //           Text('Review',
  //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
  //           Row(
  //             children: [
  //               Row(
  //                 children: List.generate(
  //                       4,
  //                       (index) =>
  //                           Icon(Icons.star, size: 20, color: Colors.amber),
  //                     ) +
  //                     [
  //                       Icon(Icons.star,
  //                           size: 20, color: ColorsApp.greyscale400)
  //                     ],
  //               ),
  //               SizedBox(width: 8),
  //               Text('(4.0)', style: TextStyle(color: ColorsApp.greyscale700))
  //             ],
  //           ),
  //           SizedBox(height: 16),
  //           Row(
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: ColorsApp.greyscale300),
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     Icon(Icons.remove, size: 18),
  //                     SizedBox(width: 8),
  //                     Text('1'),
  //                     SizedBox(width: 8),
  //                     Icon(Icons.add, size: 18),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(width: 16),
  //               Text(
  //                 '\$39.99',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w700,
  //                     fontSize: 16,
  //                     color: ColorsApp.primary500),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 24),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: ElevatedButton(
  //                   onPressed: () {},
  //                   style: ElevatedButton.styleFrom(
  //                       backgroundColor: ColorsApp.primary500),
  //                   child: Text('Continue shopping',style: TextStyle(color: ColorsApp.white),),
  //                 ),
  //               ),
  //               SizedBox(width: 12),
  //               Expanded(
  //                 child: OutlinedButton(
  //                   onPressed: () {},
  //                   style: OutlinedButton.styleFrom(
  //                     side: BorderSide(color: ColorsApp.primary500),
  //                   ),
  //                   child: Text('Add to cart'),
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }




void _showBookDetail(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    isScrollControlled: true,
    builder: (context) => BlocProvider(
      create: (_) => CounterCubit(),
      child: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'The Kite Runner',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.greyscale900,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // isPressed - agar State ichida bo'lsa, setState chaqirib
                    // o'zgartirish mumkin.
                  },
                  child: Icon(
                    Icons.favorite,
                    color: ColorsApp.greyscale200,
                  ),
                ),
              ],
            ),
            Text(
              'GoodDay',
              style: TextStyle(
                color: ColorsApp.primary500,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet...',
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
                        (index) =>
                            Icon(Icons.star, size: 20, color: Colors.amber),
                      ) +
                      [
                        Icon(Icons.star,
                            size: 20, color: ColorsApp.greyscale400)
                      ],
                ),
                SizedBox(width: 8),
                Text('(4.0)', style: TextStyle(color: ColorsApp.greyscale700))
              ],
            ),
            SizedBox(height: 16),

            // BlocBuilder orqali raqamni ko‘rsatamiz va tugmalarni qo‘shamiz
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.greyscale300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: BlocBuilder<CounterCubit, int>(
                    builder: (context, count) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                context.read<CounterCubit>().subtraction(),
                            child: Icon(Icons.remove, size: 18),
                          ),
                          SizedBox(width: 8),
                          Text('$count'),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () =>
                                context.read<CounterCubit>().increment(),
                            child: Icon(Icons.add, size: 18),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  '\$39.99',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorsApp.primary500,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.primary500),
                    child: Text('Continue shopping',
                        style: TextStyle(color: ColorsApp.white)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      int count = context.read<CounterCubit>().state;
                      // countin cartga qsh
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorsApp.primary500),
                    ),
                    child: Text('Add to cart'),
                  ),
                ),
              ],
            ),
          ],
        ),
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
                itemBuilder: (context, index) => InkWell(
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
    );
  }
}
