import 'package:flutter/material.dart';
import 'package:project1/settings/settings.dart';

class Appbarr extends StatelessWidget  {
  final String title;

  const Appbarr({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context); 
        },
        child: const Icon(Icons.arrow_back),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Settings(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.notifications_none),
          ),
        ),
      ],
    );
  }
}
