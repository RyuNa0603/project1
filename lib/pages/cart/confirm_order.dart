import 'package:flutter/material.dart';
import 'package:project1/bottomsheet/delivery_date_sheet.dart';
import 'package:project1/bottomsheet/details_sheet.dart';
import 'package:project1/bottomsheet/payment_sheet.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/pages/cart/location.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.notifications_none),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.greyscale200),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        leading: IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: ColorsApp.primary500,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Location(),
                              ),
                            );
                          },
                        ),
                        title: Text(
                          "Utama Street No.20",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: ColorsApp.greyscale900,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              "Dumbo Street No.20, Dumbo, New York 10001, United States",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorsApp.greyscale500,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: ColorsApp.primary500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsApp.greyscale800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.greyscale200),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorsApp.greyscale900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                          Text(
                            '\$87.10',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                          Text(
                            '\$2',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                          Text(
                            '\$89.10',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: ColorsApp.greyscale900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showPaymentDetailsBottomSheet(context);
                            },
                            child: Text(
                              'See details',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: ColorsApp.primary500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorsApp.primary500,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.greyscale200),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date and time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorsApp.greyscale900,
                        ),
                      ),
                      ListTile(
                        leading: IconButton(
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: ColorsApp.primary500,
                            size: 40,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24)),
                              ),
                              builder: (context) => const DeliveryDateSheet(),
                            );
                          },
                        ),
                        title: Text(
                          'Date & time',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: ColorsApp.greyscale900,
                          ),
                        ),
                        subtitle: Text(
                          'Choose date and time ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorsApp.greyscale500,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsApp.greyscale800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.greyscale200),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorsApp.greyscale900,
                        ),
                      ),
                      ListTile(
                        leading: IconButton(
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: ColorsApp.primary500,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                        title: Text(
                          "Payment",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: ColorsApp.greyscale900,
                          ),
                        ),
                        subtitle: Text(
                          "Choose your payment",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorsApp.greyscale500,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorsApp.greyscale800,
                          ),
                          onPressed: () {
                            CardBottomSheet(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
              // ListTile(title: Text('Lorem Street No. 5')),
              // Divider(),
              // Text('Summary', style: TextStyle(fontWeight: FontWeight.bold)),
              // ListTile(title: Text('Items Total: \$45.00')),
              // ListTile(title: Text('Delivery Fee: \$5.00')),
              // ListTile(title: Text('Total: \$50.00')),
              // Divider(),
              // Text('Payment', style: TextStyle(fontWeight: FontWeight.bold)),
              // ListTile(
              //   leading: Icon(Icons.credit_card),
              //   title: Text('Credit Card'),
              //   trailing: Icon(Icons.keyboard_arrow_right),
              //   onTap: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (_) => PaymentMethodPage()),
              //     // );
              //   },
              // ),
              // Spacer(),
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (_) => OrderStatusPage()),
              //     // );
              //   },
              //   child: Center(child: Text('Order')),
              //   style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              // )
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: ColorsApp.primary500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: Text(
                  "Order",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorsApp.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
