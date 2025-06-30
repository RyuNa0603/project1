import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  'October 2021',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
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
                        subtitle: Row(
                          children: [
                            Text(
                              "Delivered",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.greenAccent[700],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "1 item",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: ColorsApp.greyscale500,
                              ),
                            ),
                          ],
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
                        subtitle: Row(
                          children: [
                            Text(
                              "Delivered",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.greenAccent[700],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "5 item",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: ColorsApp.greyscale500,
                              ),
                            ),
                          ],
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
                        subtitle: Row(
                          children: [
                            Text(
                              "Cancelled",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "2 item",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: ColorsApp.greyscale500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
