import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/product_details_screen.dart';
import '../models/deal_model.dart';

class Navigation {
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  static void navigateToProductDetails(BuildContext context, Deal deal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetails(deal: deal),
      ),
    );
  }
}
