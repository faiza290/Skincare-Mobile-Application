import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'order_history_page.dart';
import 'recently_viewed_page.dart';
import 'settings_page.dart';
import 'help_support_page.dart';
import 'package:flutter_application_1/Authentication/signup.dart'; 

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color.fromRGBO(72, 52, 102, 1.0),
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Profile content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile_placeholder.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(72, 52, 102, 1.0),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "john.doe@example.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20),
                ProfileMenuItem(
                  icon: Icons.person,
                  title: "Edit Profile",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage())),
                ),
                ProfileMenuItem(
                  icon: Icons.shopping_bag,
                  title: "Order History",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryPage())),
                ),
                ProfileMenuItem(
                  icon: Icons.history,
                  title: "Recently Viewed",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RecentlyViewedPage())),
                ),
                ProfileMenuItem(
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())),
                ),
                ProfileMenuItem(
                  icon: Icons.help,
                  title: "Help & Support",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupportPage())),
                ),
                ProfileMenuItem(
                  icon: Icons.exit_to_app,
                  title: "Logout",
                  onTap: () {
                    // Navigate to the signup page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ProfileMenuItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color.fromRGBO(72, 52, 102, 1.0)),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: Color.fromRGBO(72, 52, 102, 1.0)),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Color.fromRGBO(72, 52, 102, 1.0)),
      onTap: onTap,
    );
  }
}