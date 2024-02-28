import 'package:calipay/screens/supplier_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../style/theme.dart' as Style;

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },),
                        const Text('New Customer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.white70, width: 5),
                        ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blueGrey.shade50,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 5),
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Customer Full Name',
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 14),
                                suffixIcon: Icon(Icons.person, color: Style.Colors.redBrown, size: 15),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blueGrey.shade50,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 5),
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Customer Email Address',
                                hintStyle: TextStyle(fontSize: 14),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.email_outlined, color: Style.Colors.redBrown, size: 15),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blueGrey.shade50,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 5),
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Customer Phone Number',
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 14),
                                suffixIcon: Icon(CupertinoIcons.phone, color: Style.Colors.redBrown, size: 15),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.blueGrey.shade50,
                            ),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: TextField(
                                      showCursor: true,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        hintText: 'Customer Address (Optional)',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey , fontSize: 13), // Add hintStyle here
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: RoundedButton(
                            text: 'Submit',
                            press: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SupplierList()));
                            },
                            color: Style.Colors.buttonBlue,
                            textColor: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],),
    );
  }
}
