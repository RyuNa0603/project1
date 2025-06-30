import 'package:flutter/material.dart';
import 'package:project1/core/colors_app.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.person,
      'text': 'My Account',
    },
    {
      'icon': Icons.location_on,
      'text': 'Address',
    },
    {
      'icon': Icons.local_fire_department,
      'text': 'Offers & Promos',
    },
    {
      'icon': Icons.favorite,
      'text': 'Your Favorites',
    },
    {
      'icon': Icons.assignment,
      'text': 'Order History',
    },
    {
      'icon': Icons.support_agent,
      'text': 'Help Center',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: ColorsApp.greyscale900,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 214, 163, 121),
              radius: 28,
            ),
            title: Text(
              "John Doe",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "(+1) 234 567 890",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              "Logout",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorsApp.red,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 6,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(children: [
                  ListTile(
                    leading: Icon(
                      item['icon'],
                      color: ColorsApp.primary500,
                    ),
                    title: Text(
                      item['text'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {},
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
