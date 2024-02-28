import 'package:calipay/auth/code_verification.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {

 @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const CodeVerification(),
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
                    // alignment: const Alignment(0.0, 0.7), // Adjusted alignment to move the logo down
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
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(height: 6.0),
                        const Text('Recover\nPassword', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, wordSpacing: 2)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65.0),
                          child: Divider(height: 2, thickness: 3, color: Colors.grey),
                        ),
                        const Text('Lost you password? Not a problem. Enter\nyour email, and we\'ll send you a secure link\nto reset it. Your account security is our top\npriority. Regain access quickly and securely.\nJust a few clicks away.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            )
                         ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65.0),
                          child: Divider(height: 2, thickness: 3, color: Colors.grey),
                        ),
                        Material(
                          elevation: 3,
                          child: Container(
                            height: 50,
                            width: 320,
                            /* width: size.width * 0.6,  // mediaquery is giving error o, I don't understand
                            height: size.height * 0.08,*/
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              // border: Border.all(color: Colors.grey), // Define the border
                              borderRadius: BorderRadius.circular(10), // Optionally, add border radius
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 13.0),
                              child: TextField(
                                showCursor: true,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                                  suffixIcon: Icon(Icons.email_sharp, color: Colors.brown, size: 15),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ), /*
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade100,
                            ),
                            elevation: MaterialStateProperty.all<double>(3),
                          ),
                          child: SizedBox(
                            width: size.width * 0.6,
                            height: size.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Email Address',
                                  style: TextStyle(color: Colors.black38),
                                ),
                                Icon(Icons.email_sharp, color: Colors.blue.shade700)
                              ],
                            ),
                          ),
                        ),
*/
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: RoundedButton(
                            text: 'Submit',
                            press: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CodeVerification()));
                            },
                            color: const Color(0xFF000E6D),
                            textColor: Colors.white),
                         ),
                      ],),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
