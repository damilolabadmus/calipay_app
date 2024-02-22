import 'package:calipay/screens/customer_list.dart';
import 'package:flutter/material.dart';
import '../components/dashboard_item.dart';
import '../utils/pandora.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final Pandora pandora = Pandora();
  List<Widget> dashboardItem = [];

  final dashboardMenu = [
    {"image":'assets/customers.png',"name": "Customers", 'position': 0},
    {"image":'assets/suppliers.png',"name": "Suppliers", 'position': 1},
    {"image":'assets/products.png',"name": "Products", 'position': 2},
    {"image":'assets/pos.png',"name": "POS", 'position': 3},
    {"image":'assets/orders.png',"name": "Orders", 'position': 4},
    {"image":'assets/expenses.png',"name": "Expenses", 'position': 5},
    {"image":'assets/report.png',"name": "Report", 'position': 6},
    {"image":'assets/settings.png',"name": "Settings", 'position': 7},
    {"image":'assets/profile.png',"name": "Profile", 'position': 8},
    {"image":'assets/sales.png',"name": "Sales", 'position': 9},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const CustomerList(),
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
              Color(0xFF000E6D), // Deep blue color
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
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.7,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: dashboardMenu.map((item) {
                       return DashboardItem(
                       message: item["name"] as String?,
                      image: item["image"] as String?,
                      press: () {},
                      );
                     }).toList()),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
