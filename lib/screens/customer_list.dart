import 'package:calipay/screens/add_customer.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final customerItems = [
    {"name": 'Mahmud Muhammed', "phoneNumber": '08160327173', "description": '236 Street Name, Kano Town,\nKano State, Nigeria'},
    {"name": 'Kingsley David', "phoneNumber": '08115455294', "description": '79 Folagoro, Shomolu,\nLagos State, Nigeria'},
    {"name": 'Chris Bruce', "phoneNumber": '08170327473', "description": '328, Herbert Macauley, Sabo Yaba,\nLagos State, Nigeria'},
    {"name": 'Sheriff Ahmad', "phoneNumber": '08160327173', "description": 'Federal Housing Lugbe,\nAbuja, FCT'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const NewCustomer(),
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
                        const Text('Customers', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey.shade200,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 7.0, left: 5),
                          child: TextField(
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
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
                          children: customerItems.map((item) {
                            return Card(
                              color: Style.Colors.buttonBlue,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Style.Colors.grey200,
                                      radius: 45,
                                      child: Image.asset(
                                        'assets/profile.png',
                                        height: 65,
                                        width: 68,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('Mahmud Muhammed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Poppins-Regular')),
                                          Text('08160327173', style: TextStyle(color: Colors.white, fontSize: 19)),
                                          Text('236 Street Name, Kano Town,\nKano State, Nigeria', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(
                                                Colors.grey.shade100,
                                              ),
                                            ),
                                            child: const Icon(Icons.remove_red_eye),
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
                                            child: const Icon(Icons.phone),
                                          ),
                                        ),
                                      ],
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

/*
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.8,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1), // Border color
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300// Border radius
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 7.0, left: 5),
                          child: TextField(
                            showCursor: true,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search, color: Style.Colors.buttonBlue),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                            customerItems.map((item) {
                            return Card(
                              color: Style.Colors.buttonBlue,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(backgroundColor: Style.Colors.grey200, radius: 45,
                                      child: Image.asset(
                                        'assets/logo_filled.png',
                                        height: 65,
                                        width: 68,
                                        fit: BoxFit.fill,
                                      ),),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('Mahmud Muhammed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Poppins-Regular')),
                                          Text('08160327173', style: TextStyle(color: Colors.white, fontSize: 19)),
                                          Text('236 Street Name, Kano Town,\nKano State, Nigeria', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                                        ],),
                                    ),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(
                                                Colors.grey.shade100,
                                              ),
                                             ),
                                            child: const Icon(Icons.remove_red_eye)),
                                        ElevatedButton(
                                            onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(
                                                Colors.grey.shade100,
                                              ),
                                             ),
                                            child: const Icon(Icons.phone)),
                                    ],)
                                  ],
                                ),
                              ),
                            );
                          }).toList()))
                  ],
                ),
              )
           ),)
*/
       ],),
     );
  }
}
