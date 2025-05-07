import 'package:elegenza/core/constants/theme.dart';
import 'package:elegenza/presentation/cart_screen/controller/cart_controller.dart';
import 'package:elegenza/presentation/login_screen/controller/auth_controller.dart';
import 'package:elegenza/presentation/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashScreen(),
      ),
    );
  }
}