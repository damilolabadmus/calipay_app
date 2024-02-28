import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class SalesList extends StatefulWidget {
  const SalesList({super.key});

  @override
  State<SalesList> createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  final customerItems = [
    {"description": 'LG 32 TV with free Antenna', "price": 'N92,790.76 x 3', "total": 'N278,372.28', "image": 'assets/tv.png'},
    {"description": 'Samsung 33', "price": 'N5,000.00 x 7', "total": 'N35,000', "image": 'assets/mouse.png'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                        const Text('All Sales', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                                      height: 60,
                                      width: 60,
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
                                          const SizedBox(height: 5),
                                          Row(children: [
                                            Text("Price: ${item["price"]}  |  ", style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular')),
                                            Text('Total: ${item["total"]}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular')),
                                          ],)
                                         ],
                                      ),
                                    ),
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
