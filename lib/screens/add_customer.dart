import 'package:calipay/screens/supplier_list.dart';
import 'package:flutter/material.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 30000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const SupplierList(),
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
