import 'package:calipay/screens/payment_option.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final customerItems = [
    {"name": 'GoodTime Mouse', "address": '8000 DPL, Rainbo', "price": 'Price: N2,000.00', "image": 'assets/mouse.png'},
    {"name": 'Royal Tv', "address": 'LED/HG (RTV32SA72)', "price": 'Price: N80,000.00', "image": 'assets/tv.png'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const PaymentOption(),
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
                          icon: const Icon(Icons.arrow_back_ios, size: 20),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },),
                        const Text('My Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                height: size.height * 0.7,
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
                                shadowColor: Style.Colors.buttonBlue,
                                color: Style.Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent, // Set background color to transparent
                                        radius: 40,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: Style.Colors.gradientColor,
                                          ),
                                          child: Image.asset(
                                            item["image"]!,
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(item["name"]!, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'Poppins-Regular')),
                                            Text(item["address"]!, style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(item["price"]!, style: const TextStyle(color: Style.Colors.buttonBlue, fontWeight: FontWeight.w400, fontSize: 10)),
                                            ),
                                            Row(children: [
                                              Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                                  decoration: const BoxDecoration(
                                                      color: Style.Colors.grey200,
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                  child: const Text('-', style: TextStyle(fontWeight: FontWeight.w800),)),
                                              const Text('10', style: TextStyle(color: Style.Colors.buttonBlue, fontWeight: FontWeight.w400)),
                                              Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                                  decoration: const BoxDecoration(
                                                      color: Style.Colors.grey200,
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                                                  child: const Text('+')),
                                            ],)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                              Colors.grey.shade100,
                                            ),
                                          ),
                                          child: const Icon(Icons.delete_outline_rounded, color: Colors.red, size: 16),
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
