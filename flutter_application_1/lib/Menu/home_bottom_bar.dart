import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorite/wishlist_favorite.dart';
import 'package:flutter_application_1/cart/cart_page.dart';
import 'package:flutter_application_1/profile/profile_screen.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromRGBO(72, 52, 102, 1.0).withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(Icons.home, "Home", isSelected: true),
          _buildIcon(Icons.shopping_cart, "Cart", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }),
          _buildIcon(Icons.favorite_outline_rounded, "Favorites", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesWishlistPage()),
            );
          }),
          _buildIcon(Icons.account_circle, "Profile", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label, {bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {
        // Add other navigation or interaction functionality here if needed
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            size: 30,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}