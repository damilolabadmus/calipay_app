import 'package:calipay/screens/reports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final profileItems = [
    {"name": 'Mahmud Muhammed', "icon": CupertinoIcons.person},
    {"name": 'mahmud enterprise', "icon": CupertinoIcons.creditcard},
    {"name": 'mahmud@gmail.com', "icon": CupertinoIcons.mail},
    {"name": '+234 8160327173', "icon": Icons.phone},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

   Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const Reports(),
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
                        const Text('My Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins-Regular')),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CircleAvatar(backgroundColor: const Color(0xFF8B4513), radius: 45,
                      child: Image.asset(
                        'assets/calipay_logo.png',
                        height: 80,
                        width: 110,
                      ),),
                  ),
                ),
                /*const CircleAvatar(
                  radius: 50,
                  backgroundColor: Style.Colors.redBrown,
                  // child: Image.asset('assets/logo_filled.png'),
                ),*/
              ],
            ),
          ),
         /* const Positioned.fill( /// this CircleAvatar should be over the top code and the bottom Positioned. Half way each
            left: 5,
            bottom: -10,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Style.Colors.redBrown,
            ),
          ),*/
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
                    const Text('Plan: Basic Plan', style: TextStyle(color: Colors.white, fontSize: 10)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),)
                        ),
                        child: SizedBox(
                          width: size.width * 0.1,
                          height: 12,
                          child: const Text(
                            'Upgrade',
                            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: profileItems.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade200, width: 1),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blueGrey.shade50,
                                ),
                                child: TextField(
                                  showCursor: true,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: item["name"] as String,
                                    hintStyle: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                                    border: InputBorder.none,
                                    suffixIcon: Icon(item["icon"] as IconData?),
                                    suffixIconColor: Style.Colors.redBrown.withOpacity(0.7),
                                    contentPadding: const EdgeInsets.only(left: 7.0, top: 10),
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
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
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: '345, Herbert Macauley, Sabo, Lagos Nigeria',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12), // Add hintStyle here
                                  ),
                                ),
                              ),
                            ),
                          ],
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
