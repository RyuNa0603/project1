import 'package:flutter/material.dart';

void showPaymentDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    backgroundColor: Colors.white,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Payment Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _rowWithLabel("Price", "\$87.10", isBold: true),
                SizedBox(height: 8),
                _subRow("Squid Sweet and Sour Salad", "\$19.99"),
                _subRow("Japan Hainanese Sashimi", "\$39.99"),
                _subRow("Black Pepper Beef Lumpia", "\$27.12"),
                SizedBox(height: 16),
                Divider(height: 1, color: Colors.grey.shade300),
                SizedBox(height: 12),
                _rowWithLabel("Shipping", "\$2"),
                SizedBox(height: 12),
                Divider(height: 1, color: Colors.grey.shade300),
                SizedBox(height: 12),
                _rowWithLabel("Total Payment", "\$89.10", isBold: true),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _rowWithLabel(String label, String value, {bool isBold = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          color: Colors.black,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget _subRow(String title, String price) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}
