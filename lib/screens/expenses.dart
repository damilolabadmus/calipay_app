import 'package:calipay/screens/add_expenses.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final expenseItems = [
    {"name": 'My Personal', "details": 'Expenses for car', "date": '5th December, 2023'},
    {"name": 'My medical bills', "details": '', "date": '', "day": '3rd January, 2024'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const NewExpenses(),
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
                        const Text('Expenses', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
                        const Padding(
                          padding: EdgeInsets.only(left: 32.0),
                          child: Icon(Icons.calendar_month, color: Colors.white, size: 30,),
                        ),
                        Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.only(left: 28),
                          child: Image.asset(
                            'assets/logo_filled.png',
                            height: 60,
                            width: 90,
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
                height: size.height * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 7.0, left: 5),
                          child: TextField(
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              suffixIcon: Icon(Icons.search, color: Style.Colors.buttonBlue),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: expenseItems.map((item) {
                            return Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const CircleAvatar(
                                      radius: 25,
                                      child: Icon(Icons.print_sharp, color: Style.Colors.buttonBlue, size: 20)
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('My Roses Supplier', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'Poppins-Regular')),
                                          Text('Justice Maxwell', style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
                                          // Divider(height: 2, color: Colors.white, thickness: 4),
                                          SizedBox(height: 6),
                                          Text('08115455294', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w400, fontSize: 10)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.grey.shade100,
                                          ),
                                        ),
                                        child: const Icon(Icons.brush_outlined, color: Colors.blue, size: 15)
                                      ),
                                    )
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.white10,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewExpenses()));
            },
            elevation: 4,
            child: const Icon(Icons.print_sharp, color: Colors.blueGrey, size: 35),
          ),
        ],
      ),
    );
  }
}
