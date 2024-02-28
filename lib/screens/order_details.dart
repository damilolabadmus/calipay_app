import 'package:calipay/screens/expenses.dart';
import 'package:calipay/screens/receipt_page.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final customerItems = [
    {"description": 'GoodTime Mouse,\n8000 DPL Rainbo', "price": 'N2,000.00', "quantity": '10 Pieces', "total": 'N20,000.00', "image": 'assets/mouse.png'},
    {"description ": 'Samsung 33', "price": 'N80,000.00', "quantity": '2 pieces', "total": 'N160,000.00', "image": 'assets/tv.png'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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

    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Color(0xFF000E6D),
              BlendMode.modulate,
            ),
            child: Image.asset(
              'assets/colored_background.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },),
                        const Text('Order Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
                        Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.only(left: 28),
                          child: Image.asset(
                            'assets/logo_filled.png',
                            height: 70,
                            width: 100,
                          ),),
                      ],
                    )
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.8,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: customerItems.map((item) {
                            return Card(
                              elevation: 5,
                              shadowColor: Colors.red,
                              color: Style.Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      '${item["image"]}',
                                      height: 25,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${item["description"]}',
                                              style: const TextStyle(
                                                  color: Style.Colors.buttonBlue, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Poppins-Regular')),
                                         const Divider(height: 2, thickness: 5, color: Style.Colors.buttonBlue),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Price: ${item["price"]}  |  ", style: const TextStyle(color: Style.Colors.buttonBlue, fontWeight: FontWeight.w500, fontSize: 8, fontFamily: 'Poppins-Regular')),
                                              Text("Qty: ${item["quantity"]}", style: const TextStyle(color: Style.Colors.buttonBlue, fontWeight: FontWeight.w500, fontSize: 8, fontFamily: 'Poppins-Regular'))
                                            ],),
                                          const Divider(height: 2, thickness: 5, color: Style.Colors.white),
                                          Text('Total: ${item["total"]}', style: const TextStyle(color: Style.Colors.buttonBlue, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Poppins-Regular')),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                        width: 40,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                              Colors.grey.shade100,
                                            ),
                                          ),
                                          child: const Icon(Icons.delete_outline_rounded, color: Colors.red, size: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],),
    );
  }
}
