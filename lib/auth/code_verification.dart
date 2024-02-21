import 'package:calipay/auth/confirmation_page.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  bool hoverOn = false;

  @override
  Widget build(BuildContext context) {

    final List<String> codes = ['8', '2', '0', '6'];

    Future.delayed(const Duration(seconds: 30000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const ConfirmationPage(),
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
                    const Text('Verify Code', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, wordSpacing: 2)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.0),
                      child: Divider(height: 2, thickness: 3, color: Colors.grey),
                    ),
                    InkWell(
                        onHover: (isHover) {
                          setState(() {
                            hoverOn = isHover;
                          });
                        }, child: const Text('Lost you password? Not a problem. Enter\nyour email, and we\'ll send you a secure link\nto reset it. Your account security is our top\npriority. Regain access quickly and securely.\nJust a few clicks away.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            // decoration: hoverOn ? TextDecoration.underline : null,
                            // decoration: hoverOn = true ? TextDecoration.underline : TextDecoration.none,
                            decorationColor: Colors.blue,
                            decorationThickness: 2)
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.0),
                      child: Divider(height: 2, thickness: 3, color: Colors.grey),
                    ),
                    Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 13.0),
                        child: TextField(
                          showCursor: true,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: '8',
                            // hintText: codes[index],
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: RoundedButton(
                          text: 'Submit',
                          press: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConfirmationPage()));
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
