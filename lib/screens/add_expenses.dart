import 'package:calipay/screens/personal_expenses.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../style/theme.dart' as Style;

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final expenseItems = [
    'Expenses Title',
    'Expenses Amount',
    'Expenses Date',
    'Expenses Time',
    'Expenses Note',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const PersonalExpenses(),
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
                        const Text('New Expenses', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: expenseItems.map((item) {
                            return Padding(
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
                                      hintText: 'Expenses Title',
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.person_pin, color: Style.Colors.buttonBlue),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: RoundedButton(
                          text: 'Submit',
                          press: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonalExpenses()));
                          },
                          color: Style.Colors.buttonBlue,
                          textColor: Colors.white),
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
