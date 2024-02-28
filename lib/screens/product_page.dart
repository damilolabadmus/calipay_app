import 'package:flutter/material.dart';
import '../components/dashboard_item.dart';
import '../style/theme.dart' as Style;
import '../utils/constants.dart';
import 'cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final menuItems = [
    {"name": 'Foods', "icon": Icons.food_bank_outlined},
    {"name": 'House & Homes', "icon": Icons.home_outlined},
    {"name": 'Frozen Foods', "icon": Icons.event_seat_outlined},
  ];

  final productItems = [
    {"product": 'Royal 33 Television', "amount": 'N92,650.00', "image": 'assets/tv.png'},
    {"product": 'Longitech Wired Gaming', "amount": 'N2,000.00', "image": 'assets/mouse.png'},
    {"product": 'Royal 33 Television', "amount": 'N92,650.00', "image": 'assets/tv.png'},
    {"product": 'Longitech Wired Gaming', "amount": 'N2,000.00', "image": 'assets/mouse.png'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const Cart(),
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
                        const Text('All Products', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
                        Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.only(left: 28),
                          child: Image.asset(
                            'assets/cart.png',
                            height: 50,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Style.Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 7.0, left: 5),
                          child: TextField(
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Search..',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search, color: Colors.black12),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 4),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            decoration: const BoxDecoration(color: Style.Colors.blendedColor, borderRadius: BorderRadius.all(Radius.circular(6))),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text('Categories', style: TextStyle(color: Colors.white)),
                            )),
                      ),
                    ),
                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: menuItems.map((item) {
                          return Menu(
                            icon: item["icon"] as IconData?,
                            text: item["name"] as String?,
                          );
                        }).toList(),
                      )
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: GridView.count(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            children: productItems.map((item) {
                              return ProductItem(
                                message: item["product"],
                                price: item["amount"],
                                image: item["image"],
                                press: () {},
                              );
                            }).toList())
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




class Menu extends StatelessWidget {
  @required IconData? icon;
  @required String? text;

  Menu({super.key, this.icon, this.text});

  final List<Color> gradientColors1 = [
    Style.Colors.fourthColor,
    Style.Colors.fourthColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 90,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
              Radius.circular(40.0)),
          gradient: LinearGradient(
            colors: [Colors.grey.shade200, Colors.amber.shade100],
            begin: Alignment.bottomLeft,
            end: const Alignment(0.5, 3.0),
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(icon),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('$text',
                      style: kBankItemTitle.copyWith(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
