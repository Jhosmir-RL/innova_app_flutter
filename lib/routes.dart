import 'package:flutter/material.dart';
import 'package:app_innova/home_view/start_screen.dart';
import 'package:app_innova/home_view/home_screen.dart';
import 'package:app_innova/auth/login_screen.dart';
import 'package:app_innova/auth/register_screen.dart';
import 'package:app_innova/orders/track_orders_screen.dart';
import 'package:app_innova/orders/order_history_screen.dart';
import 'package:app_innova/profile/profile_screen.dart';
import 'package:app_innova/profile/edit_profile_screen.dart';
import 'package:app_innova/location/location_screen.dart';
import 'package:app_innova/contact/contact_screen.dart';
import 'package:app_innova/settings/logout_confirmation_screen.dart';

class AppRoutes {
  static const String start = "/";
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String trackOrders = "/trackOrders";
  static const String orderHistory = "/orderHistory";
  static const String profile = "/profile";
  static const String editProfile = "/editProfile";
  static const String location = "/location";
  static const String contact = "/contact";
  static const String logoutConfirmation = "/logout";

  static Map<String, WidgetBuilder> routes = {
    start: (context) => const StartScreen(),
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    trackOrders: (context) => const TrackOrdersScreen(),
    orderHistory: (context) => const OrderHistoryScreen(),
    profile: (context) => const ProfileScreen(),
    editProfile: (context) => const EditProfileScreen(),
    location: (context) => const LocationScreen(),
    contact: (context) => const ContactScreen(),
    logoutConfirmation: (context) => const LogoutConfirmationScreen(),
  };
}
