import 'package:calipay/auth/recover_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<String> entries = [
      'Full Name (Surname First)',
      'Business Name',
      'Email Address',
      'Phone Number',
      'Password',
      'Confirm Password',
      'Select Plan'
    ];

    final List<IconData> entryIcon = [
      CupertinoIcons.person_circle_fill,
      CupertinoIcons.add_circled_solid,
      CupertinoIcons.mail_solid,
      CupertinoIcons.phone_circle_fill,
      CupertinoIcons.lock_fill,
      CupertinoIcons.chevron_down,    ];

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const RecoverPassword(),
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
              Color(0xFF0021FF), // Deep blue color
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
                const SizedBox(height: 45),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/calipay_logo.png',
                    height: 110,
                    width: 140,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 15),
                          const Text('Sign Up', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Container(height: 2, width: 22, color: Colors.blue.shade700)
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < entries.length && index < entryIcon.length) {
                              return Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.grey.shade100,
                                      ),
                                      elevation: MaterialStateProperty.all<double>(5),
                                    ),
                                    child: SizedBox(
                                      width: size.width * 0.6,
                                      height: size.height * 0.08,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            entries[index],
                                            style: const TextStyle(color: Colors.black38),
                                          ),
                                          Icon(entryIcon[index], color: Colors.blue.shade700)
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
