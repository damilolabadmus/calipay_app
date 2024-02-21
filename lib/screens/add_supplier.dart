import 'package:calipay/screens/product_page.dart';
import 'package:flutter/material.dart';

class NewSupplier extends StatefulWidget {
  const NewSupplier({super.key});

  @override
  State<NewSupplier> createState() => _NewSupplierState();
}

class _NewSupplierState extends State<NewSupplier> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 30000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const ProductPage(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });

    return const Placeholder();
  }
}
