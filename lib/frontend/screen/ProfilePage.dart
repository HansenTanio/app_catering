import 'package:cateringapp/frontend/InitialScreen/FirstPage.dart';
import 'package:flutter/material.dart';
import 'SettingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  final String _keyPassword = "password";
  String? _usernameValue;

  void _loadData() async {
    prefs = await SharedPreferences.getInstance();
    _usernameValue = prefs.getString(_keyUsername);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyUsername, "");
    prefs.setString(_keyPassword, "");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirstPage(),
      ),
    );
  }

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
            subtitle: Text(_usernameValue.toString()),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
                Text("${_usernameValue.toString().toLowerCase()}@gmail.com"),
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
            onPressed: () => _logout(),
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
