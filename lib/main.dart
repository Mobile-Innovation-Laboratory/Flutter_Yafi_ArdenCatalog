import 'package:billiard_catalog/pages/admin_page/admin_dashboard.dart';
import 'package:billiard_catalog/pages/admin_page/create_page/create_page.dart';
import 'package:billiard_catalog/pages/admin_page/update_page/update_page.dart';
import 'package:billiard_catalog/pages/auth_page/login_page.dart';
import 'package:billiard_catalog/pages/auth_page/register_page.dart';
import 'package:billiard_catalog/pages/home_page.dart';
import 'package:billiard_catalog/pages/user_page/cart_page/cart_page.dart';
import 'package:billiard_catalog/pages/user_page/checkout/checkout_page.dart';
import 'package:billiard_catalog/pages/user_page/dashboard_page/dashboard_page.dart';
import 'package:billiard_catalog/pages/user_page/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_page',
      title: 'Arden Catalog',
      theme: _buildTheme(),
      getPages: [
        GetPage(
          name: '/home_page',
          page: () => const HomePage(),
        ),
        GetPage(name: '/dashboard_page', page: () => const DashboardPage()),
        GetPage(name: '/login_page', page: () => const LoginPage()),
        GetPage(name: '/register_page', page: () => const RegisterPage()),
        GetPage(name: '/detail_page', page: () => const DetailPage()),
        GetPage(
            name: '/admin_dashboard_page', page: () => const AdminDashboard()),
        GetPage(name: '/create_page', page: () => const CreatePage()),
        GetPage(name: '/update_page', page: () => const UpdatePage()),
        GetPage(name: '/cart_page', page: () => const CartPage()),
        GetPage(name: '/checkout_page', page: () => const CheckoutPage()),
      ],
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData(brightness: Brightness.light);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}
