import 'package:calipay/screens/add_supplier.dart';
import 'package:flutter/material.dart';

class SupplierList extends StatefulWidget {
  const SupplierList({super.key});

  @override
  State<SupplierList> createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 30000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const NewSupplier(),
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
