import 'package:calipay/components/button.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;
import 'expenses_report_range.dart';

class SalesReportRange extends StatefulWidget {
  const SalesReportRange({super.key});

  @override
  State<SalesReportRange> createState() => _SalesReportRangeState();
}

class _SalesReportRangeState extends State<SalesReportRange> {
  final salesItems = [
    'Select Range Start Date',
    'Select Range End Date',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const ExpensesReportRange(),
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
                        const Text('Sales Report Range', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                    Column(
                      children: salesItems.map((item) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () { },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(5),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    Style.Colors.white,
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                                  ),),
                                child: Text(item, style:  const TextStyle(color: Style.Colors.buttonBlue, fontSize: 17, wordSpacing: 2)),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        );
                      }).toList(),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: RoundedButton(
                        text: 'Submit',
                        press: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExpensesReportRange()));
                        },
                        textColor: Colors.white,
                        color: Style.Colors.buttonBlue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],),
    );
  }
}


/* Align(
    alignment: Alignment.topCenter,
    child: SizedBox(
      width: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.grey.shade100,
          ),
        ),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.red),
      ),
    ),
  )
*/