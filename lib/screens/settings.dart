import 'package:calipay/screens/sales_list.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final profileItems = [
    {"name": 'Shop Information'},
    {"name": 'Categories'},
    {"name": 'Update Profile'},
    {"name": '2-Authentication Setup'},
    {"name": 'Email Verification Setup'},
    {"name": 'Reset Password Setup'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const SalesList(),
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
                        const Text('Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: profileItems.map((item) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                  child: TextField(
                                    showCursor: true,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: item["name"] as String,
                                      hintStyle: TextStyle(color: Colors.blue.shade800),
                                      suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, color: Style.Colors.buttonBlue, size: 15),
                                      contentPadding: const EdgeInsets.only(left: 7.0, top: 10),
                                    ),
                                  ),
                                );
                              }).toList()
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],),
    );
  }
}
