import 'package:flutter/material.dart';
import 'expenses.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final receiptItems = [
    {"name": 'Receipt Number', "number": '77356565', "Quantity": 'Number of items: 2', "date": '6th January, 2024', "amount": "N104,764,50"},
    {"name": 'Receipt Number', "number": '24544543', "Quantity": 'Number of items: 7', "date": '3rd February, 2024', "amount": "N63,514,40"},
    {"name": 'Receipt Number', "number": '56899043', "Quantity": 'Number of items: 5', "date": '19 February, 2024', "amount": "N555,895,00"},
  ];

  @override
  Widget build(BuildContext context) {

/*
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const Expenses(),
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
*/

    return Container(color: Colors.blue);
  }
}
