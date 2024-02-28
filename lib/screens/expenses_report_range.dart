import 'package:calipay/screens/settings.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../style/theme.dart' as Style;

class ExpensesReportRange extends StatefulWidget {
  const ExpensesReportRange({super.key});

  @override
  State<ExpensesReportRange> createState() => _ExpensesReportRangeState();
}

class _ExpensesReportRangeState extends State<ExpensesReportRange> {
  final expensesItems = [
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
          pageBuilder: (_, __, ___) => const Settings(),
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
                        const Text('Expenses Report Ra..', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                      children: expensesItems.map((item) {
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Settings()));
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
