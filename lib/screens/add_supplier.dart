import 'package:calipay/screens/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../style/theme.dart' as Style;
import 'cart.dart';

class NewSupplier extends StatefulWidget {
  const NewSupplier({super.key});

  @override
  State<NewSupplier> createState() => _NewSupplierState();
}

class _NewSupplierState extends State<NewSupplier> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
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
                        const Text('New Supplier', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                          color: Colors.black26,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.white70, width: 5),
                        ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width * 0.7,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black12,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 5),
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Supplier or what?',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.image_not_supported, color: Style.Colors.buttonBlue),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width * 0.7,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black12,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 5),
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Supplier Full Name',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.person_pin, color: Style.Colors.buttonBlue),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width * 0.7,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black12,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 5),
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Supplier Phone Number',
                                border: InputBorder.none,
                                suffixIcon: Icon(CupertinoIcons.phone_circle_fill, color: Style.Colors.buttonBlue),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.black12,
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
                                        hintText: 'Supplier Address (Optional)',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey), // Add hintStyle here
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.add_card,
                                    color: Style.Colors.buttonBlue,
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
                            press: () {},
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
