import 'package:calipay/screens/add_customer.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 30000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const NewCustomer(),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Color(0xFF0021FF), // Deep blue color
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
                const SizedBox(height: 45),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/calipay_logo.png',
                    height: 110,
                    width: 140,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200, width: 1), // Border color
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey.shade100// Border radius
                            ),
                            child: const TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.search, color: Style.Colors.buttonBlue),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(backgroundColor: const Color(0xFF8B4513), radius: 75,
                                child: Image.asset(
                                  'assets/calipay_logo.png',
                                  height: 110,
                                  width: 140,
                                ),),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Welcome', style: TextStyle(letterSpacing: 10, color: Colors.white, fontWeight: FontWeight.w400)),
                                    const Text('Mahmud Muhammed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Poppins-Regular')),
                                    const SizedBox(height: 15),
                                    const Text('Plan: Basic Plan', style: TextStyle(color: Colors.white, fontSize: 19)),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.red,
                                          ),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),)
                                      ),
                                      child: SizedBox(
                                        width: size.width * 0.1,
                                        height: 15,
                                        child: const Text(
                                          'Upgrade',
                                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],),
                              )
                            ],
                          )
                      ),
                      const SizedBox(height: 35),
                    ],),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
