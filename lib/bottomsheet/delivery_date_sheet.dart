import 'package:flutter/material.dart';

class DeliveryDateSheet extends StatefulWidget {
  const DeliveryDateSheet({super.key});

  @override
  State<DeliveryDateSheet> createState() => _DeliveryDateSheetState();
}

class _DeliveryDateSheetState extends State<DeliveryDateSheet> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  final List<String> dates = [
    "Today\n12 Jan",
    "Tomorrow\n13 Jan",
    "Pick\na date"
  ];
  final List<String> times = ["Between\n10PM - 11PM", "Between\n11PM - 12AM"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Delivery date",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dates.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedDateIndex = index;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: selectedDateIndex == index
                            ? Colors.black
                            : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    dates[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: selectedDateIndex == index
                          ? Colors.black
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          const Text(
            "Delivery time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(times.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeIndex = index;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: selectedTimeIndex == index
                            ? Colors.black
                            : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    times[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: selectedTimeIndex == index
                          ? Colors.black
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Confirm",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
