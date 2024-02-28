import 'package:calipay/screens/profile_page.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;
import '../components/button.dart';

class PersonalExpenses extends StatefulWidget {
  const PersonalExpenses({super.key});

  @override
  State<PersonalExpenses> createState() => _PersonalExpensesState();
}

class _PersonalExpensesState extends State<PersonalExpenses> {

  final expenseItems = [
    'My Personal Expenses for Car',
    'N103,560.000',
    'December 5th, 2023',
    '10:36 PM',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const ProfilePage(),
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                          icon: const Icon(Icons.arrow_back_ios, size: 25),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },),
                        const Text('My Personal Expenses', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            fontFamily: 'Poppins-Regular')),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10))),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: size.height * 0.8,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60)),
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
                                width: size.width * 0.8,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.brown.shade50,
                                ),
                                child: TextField(
                                  showCursor: true,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: item,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.brown.shade50,
                        ),
                        child: const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextField(
                              showCursor: true,
                              maxLines: 6,
                              decoration: InputDecoration(
                                hintText: 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor incididunt\n ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud\n exercitation ullamco laboris nisi ut aliquip ex\n ea commodo consequat. Duis aute irure dolor in\n reprehenderit in voluptate velit esse cillum nulla pariatur.\nExcepteur sint occaecat cupidatat proident.',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12), // Add hintStyle here
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: RoundedButton(
                          text: 'Submit',
                          press: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
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

