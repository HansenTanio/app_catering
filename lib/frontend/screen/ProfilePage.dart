import 'package:flutter/material.dart';

import 'SettingPage.dart';

class ProfilePage extends StatelessWidget {
  final String username = "Riska";
  final String email = "Riska@gmail.com";

  void _logout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Nama Pengguna',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(username),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(email),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman pengaturan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ),
              );
            },
            child: Text('Pengaturan'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => _logout(context),
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
